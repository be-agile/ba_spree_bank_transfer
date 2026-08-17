# frozen_string_literal: true

module SpreeBankTransfer
  module PaymentDecorator
    # このモジュールは Spree::Payment に prepend されるため、これらの定数は ancestors 経由で
    # Spree::Payment::BANK_ATTRIBUTES / ::RECEIPT_VALID_TYPES として参照できる
    # (payments_controller / payment/bank_updater / _bank_transfer_form.html.erb が参照している)。
    BANK_ATTRIBUTES = [ :deposited_on, :bank_name, :account_no, :transaction_reference_no, :receipt ]
    RECEIPT_VALID_TYPES = %w[image/png image/jpeg image/jpg].freeze

    def self.prepended(base)
      base.attr_accessor :validate_bank_details

      base.has_one_attached :receipt

      base.validate :validate_receipt_type, if: :validate_bank_details
      base.validates :bank_name, :deposited_on, :receipt, presence: true, if: :validate_bank_details

      base.scope :from_bank_transfer, lambda {
        joins(:payment_method).where(spree_payment_methods: { type: 'Spree::PaymentMethod::BankTransfer' })
      }

      if base.whitelisted_ransackable_attributes.exclude?('bank_name')
        base.whitelisted_ransackable_attributes += %w[bank_name]
      end
    end

    def bank_transfer_payment?
      payment_method.is_a?(Spree::PaymentMethod::BankTransfer)
    end

    def details_submitted?
      bank_name?
    end

    private

    def validate_receipt_type
      return unless receipt.attached?

      unless receipt.content_type.in?(RECEIPT_VALID_TYPES)
        errors.add(:receipt, :invalid_file_type)
      end
    end
  end
end

Spree::Payment.prepend(SpreeBankTransfer::PaymentDecorator)
