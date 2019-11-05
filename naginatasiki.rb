#/usr/bin/env ruby

require 'json'
require_relative './karabiner_elements.rb'

module NaginataSiki
  include KarabinerElements

  def self.sands
    KarabinerElements.hold_to_shift(KeyCode::SPACE)
  end

  def self.gen
    manipulators = [
      sands,
    ]
    KarabinerElements.generate("薙刀式（v11）", "薙刀式 for Dvorak", manipulators)
  end
end

puts NaginataSiki.gen
