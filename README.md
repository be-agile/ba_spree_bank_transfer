# ba_spree_bank_transfer

This is a fork of [spree_bank_transfer](https://github.com/vinsol-spree-contrib/spree_bank_transfer) with additional features and improvements.

ba_spree_bank_transfer is an extension which allows adding a new payment method "Bank Transfer" to existing spree e-commerce store. With the help of this payment method customer can place an order online and pay by transferring money directly into merchant's Bank account. This extension allow merchants to provide their bank account(s) details which in turn is used by customers to order and pay using this method. This extension also facilitate admin to Activate/Deactivate attached Bank accounts. Admin can also filter orders on the basis of the available payment transaction reference numbers with this extension.

## Features

* Supports Ruby 3.1
* Supports Rails 7.1
* Supports Spree 4.10
* Japanese translations included
* Actively maintained with contributions back to the original project

## Installation

1. Add ba_spree_bank_transfer to your Gemfile:

```ruby
gem 'ba_spree_bank_transfer'
```

2. Install the gem using Bundler:

```shell
bundle install
```

3. Copy & run migrations:

```shell
bundle exec rails g ba_spree_bank_transfer:install
```

## How it works

* To add Bank Transfer feature, Admin needs to add "Bank Transfer" payment method:

   Configuration -> Payment Methods -> New payment Method

   You need to select "Spree::PaymentMethod::BankTransfer" as the Provider

* Add bank account information from "Banks" link on "Configuration" page.

  - Provide Name of the bank
  - Provide Account number
  - Select "Status" check box
  - Provide "Additional Details", like "Branch Name", "Bank code" etc.

    **Bank Account will be visible on Checkout Page only if it is Active.**

* After adding the payment method and bank details (as stated above), this payment method will be visible on Checkout page while making payment against an order.

* Active merchant **accounts number** will also be visible on Checkout page under this method.

**"How Bank Transfer Works" link will open a pop-up window. It will list all steps to complete order with this method.**

* Customer will be able to order by completing the order with this method and can transfer money equal to total order value directly into any one of the merchant's bank account.

* After customer deposits money into merchant's account, a payment transaction reference number is provided by the bank. Customer needs to add this payment reference details with the respective order by going to order detail page.

     My Account -> Order no. -> Add details (Payment information column) -> Submit

* Admin will be able to see the payment reference details, added by customer, on the Order detail page.

       Orders -> Order no. ->  Payments

* The order will not be marked Completed until admin captures the payment as mentioned in step above.

      Note: Admin needs to manually verify the transaction details from their bank account before capturing the payment

* Admin can filter orders which has payment transaction reference number by clicking the check box "only show orders with bank transfer payment reference number" on "Orders" page.

## Contributing

1. Fork the repo.
2. Clone your repo.
3. Run `bundle install`.
4. Run `bundle exec rake test_app` to create the test application in `spec/test_app`.
5. Make your changes.
6. Ensure specs pass by running `bundle exec rspec spec`.
7. Submit your pull request.

## Testing

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use its factories.
Simply add this require statement to your spec_helper:

```ruby
require 'ba_spree_bank_transfer/factories'
```

## License

This extension is available as open source under the terms of either:
* [GNU Affero General Public License v3.0 or later (AGPL-3.0-or-later)](https://www.gnu.org/licenses/agpl-3.0.en.html)
* [BSD 3-Clause License](https://opensource.org/licenses/BSD-3-Clause)

## Credits

Originally created by Vinsol.
Fork maintained by [be agile Co., Ltd.](https://be-agile.jp/).