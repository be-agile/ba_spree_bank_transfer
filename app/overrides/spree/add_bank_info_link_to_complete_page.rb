Deface::Override.new(
  virtual_path: 'spree/shared/_payment',
  name: 'add_bank_info_link_to_complete_page',
  replace: "div.d-flex.flex.items-top.align-items-top.gap-3 div:last-of-type",
  text: "<%= payment.payment_method.name %>
  <% if payment.payment_method.type == 'Spree::PaymentMethod::BankTransfer' %>
    <%= link_to(
      Spree.t(:how_bank_transfer_works),
      bank_transfer_instructions_path,
      id: 'banktransfer_instructions',
      class: 'mb-3 block hover:underline',
      target: '_blank'
    ) %>
  <% end %>
  "
)