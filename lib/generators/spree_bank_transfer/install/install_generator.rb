module SpreeBankTransfer
  module Generators
    class InstallGenerator < Rails::Generators::Base

      class_option :auto_run_migrations, type: :boolean, default: true

      def add_images
        append_file "app/assets/config/manifest.js", "\n//= link spree_bank_transfer/payment_details.png\n"
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_bank_transfer'
      end

      def run_migrations
        if options[:auto_run_migrations] || ['', 'y', 'Y'].include?(ask 'Would you like to run the migrations now? [Y/n]')
          run 'bundle exec rake db:migrate'
        else
          puts "Skiping rake db:migrate, don't forget to run it!"
        end
      end
    end
  end
end
