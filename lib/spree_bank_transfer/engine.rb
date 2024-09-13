module SpreeBankTransfer
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace SpreeBankTransfer
    engine_name 'spree_bank_transfer'

    config.autoload_paths += %W[#{config.root}/lib]

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      Spree.user_class.class_eval do
        has_many :payments, through: :orders
      end
    end

    initializer 'spree_bank_transfer.autoloader' do |app|
      if Rails.autoloaders.zeitwerk_enabled?
        Rails.autoloaders.main.ignore("#{root}/app/overrides")
      end
    end

    config.after_initialize do
      Rails.application.config.spree.payment_methods << Spree::PaymentMethod::BankTransfer
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
