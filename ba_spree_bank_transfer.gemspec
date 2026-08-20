# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree_bank_transfer/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'ba_spree_bank_transfer'
  s.version     = SpreeBankTransfer::VERSION
  s.summary     = 'Spree extension to create bank transfer payment method. (be agile fork)'
  s.description = 'This Spree extension provides bank transfer payment method functionality. Compatible with Ruby 3.1, Rails 7.2 and Spree 5.0.'
  s.required_ruby_version = '>= 3.1.4'

  s.author      = 'be agile Co., Ltd.'
  s.email       = 'develop@be-agile.jp'
  s.homepage    = 'https://github.com/be-agile/ba_spree_bank_transfer'
  s.licenses    = ['AGPL-3.0-or-later']

  # `git ls-files` を使わない: フォーク元やリネーム前の古いファイルが git 上に残っていると、
  # 削除漏れがあった場合にそれらも巻き込んでパッケージしてしまう(#1317 で実際に発生した不具合)。
  # 明示的な Dir[] にすることで、実際にディスク上にある現行ファイルだけをパッケージする。
  s.files        = Dir['LICENSE', 'README.md', 'Gemfile', 'Rakefile', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 5.3.0'
  s.add_dependency 'spree_admin', '= 5.3.6'
  s.add_dependency 'spree_storefront', '= 5.3.6'
  s.add_dependency 'deface'

  # @gem-override マーカーの差分確認に使う開発ツール
  s.add_development_dependency 'gem_override_marker'
end
