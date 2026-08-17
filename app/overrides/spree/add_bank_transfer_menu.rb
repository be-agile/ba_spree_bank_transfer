Deface::Override.new(
  virtual_path: 'spree/admin/shared/sidebar/_store_nav',
  name: 'add_banks_to_store_nav',
  insert_before: "erb:contains('can?(:manage, Spree::StockLocation)')",
  text: <<-HTML
    <li class="nav-item">
      <%= nav_item(Spree.t(:banks), spree.admin_banks_path, icon: 'history', active: %w[banks].include?(controller_name)) %>
    </li>
  HTML
)