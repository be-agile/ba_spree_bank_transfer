module SpreeBankTransfer
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace SpreeBankTransfer
    engine_name 'spree_bank_transfer'

    config.autoload_paths += %W[#{config.root}/lib]

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Ensure that the Spree::User class has a has_many :payments association
      if Spree.user_class && !Spree.user_class.reflect_on_association(:payments)
        Spree.user_class.class_eval do
          has_many :payments, through: :orders
        end
      end
    end

    initializer 'spree_bank_transfer.autoloader' do |app|
      if Rails.autoloaders.zeitwerk_enabled?
        Rails.autoloaders.main.ignore("#{root}/app/overrides")
      end
    end

    initializer 'spree_bank_transfer.assets.precompile' do |app|
      Rails.application.config.assets.precompile += %w[spree_bank_transfer/**/*]
    end

    config.after_initialize do
      Rails.application.config.spree.payment_methods << Spree::PaymentMethod::BankTransfer
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
