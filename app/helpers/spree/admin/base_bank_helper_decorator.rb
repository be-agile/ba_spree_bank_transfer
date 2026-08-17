module Spree
  module Admin
    module BaseBankHelperDecorator
      # @gem-override spree_admin-5.3.6/app/helpers/spree/admin/base_helper.rb#settings_active?
      # @see https://github.com/be-agile/giga-repeat/commit/e7122f3be620ca6c1cda9321fb2eaac71ec4b0da
      # 銀行振込(banks)管理画面でも設定メニューをアクティブ表示にするため super に追加する。
      # Spree 5.3 追従: 本家変更(deprecation 文言)は super 経由で取り込まれるため本体は無変更。
      def settings_active?
        super || %w[banks].include?(controller_name)
      end
    end
  end
end

Spree::Admin::BaseHelper.prepend Spree::Admin::BaseBankHelperDecorator
