# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree_bank_transfer/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'ba_spree_bank_transfer'
  s.version     = SpreeBankTransfer::VERSION
  s.summary     = 'Spree extension to create bank transfer payment method. (be agile fork)'
  s.description = 'This Spree extension provides bank transfer payment method functionality. Compatible with Ruby 3.1, Rails 7.1 and Spree 4.10.'
  s.required_ruby_version = '>= 3.1.4'

  s.author      = 'be agile Co., Ltd.'
  s.email       = 'develop@be-agile.jp'
  s.homepage    = 'https://github.com/be-agile/ba_spree_bank_transfer'
  s.licenses    = ['AGPL-3.0-or-later', 'BSD-3-Clause']

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- spec/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 4.10.0'
  s.add_dependency 'spree_backend', '>= 4.8.0'
  s.add_dependency 'spree_frontend', '>= 4.8.0'
  s.add_dependency 'spree_extension', '>= 0.1.0'
  s.add_dependency 'deface', '~> 1.0'
  s.add_dependency 'jquery-rails', ' ~> 4.6.0'
  s.add_dependency 'jquery-ui-rails', ' ~> 6.0.1'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rake"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg'
end
