# frozen_string_literal: true

# Spree 5.2 の新ナビゲーションシステム(legacy_sidebar_navigation=false)に対応。
# 旧来は _store_nav.html.erb の deface override(legacy)で設定エリアに「銀行」メニューを
# 追加していたが、新システムでは legacy の _store_nav が使われず無視される。
# Spree.admin.navigation.settings に登録し直す。
Rails.application.config.after_initialize do
  next unless Spree.admin.navigation.settings.exists?(:stock_locations)

  Spree.admin.navigation.settings.add :banks,
                                      label: :banks,
                                      url: :admin_banks_path,
                                      icon: 'building-bank',
                                      position: 115,
                                      active: -> { controller_name == 'banks' },
                                      if: -> { can?(:manage, Spree::Bank) }
end
