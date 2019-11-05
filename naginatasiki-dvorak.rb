#/usr/bin/env ruby

require_relative './lib/naginatasiki.rb'

include NaginataSiki

manipulators = [
  sands,
  triple_keys("o", "h", "c", "ぎょ"),
  double_keys("h", "u", "が"),
  shifted_key("h", "の"),
  single_key("h", "あ"),
]

puts generate("薙刀式（v11）", "薙刀式テスト for Dvorak", manipulators)
