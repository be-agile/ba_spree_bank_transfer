module Spree
  class PaymentMethod::BankTransfer < PaymentMethod
    def actions
      %w[capture void]
    end

    # Indicates whether its possible to capture the payment
    def can_capture?(payment)
      %w[checkout pending].include?(payment.state)
    end

    # Indicates whether its possible to void the payment.
    def can_void?(payment)
      payment.state != 'void'
    end

    def capture(*_args)
      simulated_successful_billing_response
    end

    def void(*_args)
      simulated_successful_billing_response
    end

    def source_required?
      false
    end

    def credit(*_args)
      simulated_successful_billing_response
    end

    def public_preferences
      super.merge(bank_accounts: Spree::Bank.active)
    end

    private

    def public_preference_keys
      super + [:bank_accounts]
    end

    def simulated_successful_billing_response
      ActiveMerchant::Billing::Response.new(true, '', {}, {})
    end
  end
end
