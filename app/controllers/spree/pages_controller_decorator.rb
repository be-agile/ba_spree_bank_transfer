module Spree
  module PagesControllerDecorator
    def bank_transfer
      @title = "123 Bank Transfer Instructions"
      @banks = Bank.active
    end
  end
end

Spree::PagesController.prepend Spree::PagesControllerDecorator
