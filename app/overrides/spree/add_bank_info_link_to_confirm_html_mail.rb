Deface::Override.new(
  virtual_path: 'spree/order_mailer/confirm_email',
  name: 'replace_html_confirm_email_template',
  insert_after: "table",
  text: "
  <% @order.payments.valid.each do |payment| %>
    <% if payment.payment_method.type == 'Spree::PaymentMethod::BankTransfer' %>
      <p>
        <a href='<%= Spree::Core::Engine.routes.url_helpers.bank_transfer_instructions_url(host: Spree::Store.current.url_or_custom_domain) %>' target='_blank'>
          <%= Spree.t(:how_bank_transfer_works) %>
        </a>
      </p>
    <% end %>
  <% end %>"
)