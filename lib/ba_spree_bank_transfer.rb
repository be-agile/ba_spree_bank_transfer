# gem 名を ba_spree_bank_transfer にリネームしたが、engine_name / モジュール名 /
# lib 配下の構造は spree_bank_transfer のまま据え置いている。
# Bundler.require は gem 名のファイルを require するため、その入口を用意する。
# @see https://github.com/be-agile/giga-repeat/issues/1317
require 'spree_bank_transfer'
