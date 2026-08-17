module SpreeBankTransfer
  module OrderDecorator
    def self.prepended(base)
      if base.whitelisted_ransackable_associations.exclude?('payments')
        base.whitelisted_ransackable_associations += %w[payments]
      end
    end
  end
end

Spree::Order.prepend(SpreeBankTransfer::OrderDecorator)
