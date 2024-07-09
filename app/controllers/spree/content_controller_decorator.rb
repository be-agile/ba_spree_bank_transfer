module Spree
  module ContentControllerDecorator
    def bank_transfer
    end
  end
end

Spree::ContentController.prepend(Spree::ContentControllerDecorator)