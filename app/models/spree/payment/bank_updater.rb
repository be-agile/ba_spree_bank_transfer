module Spree
  class Payment::BankUpdater
    attr_accessor :payment, :errors, :params

    def initialize(payment, params = {})
      @payment = payment
      @params = params
      @errors = []
    end

    def update
      if @payment.details_submitted?
        @errors << "Payment Details can be submitted only once."
        return false
      end

      @payment.validate_bank_details = true

      ActiveRecord::Base.transaction do
        unless @payment.update(permit_params)
          raise StandardError, @payment.errors.full_messages.to_sentence
        end

        unless update_order_state
          raise StandardError, "Failed to update order state."
        end
      end    

      true
    rescue StandardError => e
      @errors << e.message
      false
    end

    private

    def update_order_state
      @payment.order.update(payment_state: :paid)
    end

    def permit_params
      return {} unless @params

      @params.slice(*Spree::Payment::BANK_ATTRIBUTES)
    end
  end
end
