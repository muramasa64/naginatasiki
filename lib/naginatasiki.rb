require 'json'
require_relative './karabiner_elements.rb'

module NaginataSiki
  include KarabinerElements

  def self.key(key_code)
    KarabinerElements.key(key_code)
  end

  def self.key_with_shift(key_code)
    KarabinerElements.key_with_shift(key_code)
  end

  KEY_MAPS = {
    "あ" => [key("a")],
    "い" => [key("i")],
    "う" => [key("u")],
    "え" => [key("e")],
    "お" => [key("o")],
    "か" => [key("k"), key("a")],
    "き" => [key("k"), key("i")],
    "く" => [key("k"), key("u")],
    "け" => [key("k"), key("e")],
    "こ" => [key("k"), key("o")],
    "さ" => [key("s"), key("a")],
    "し" => [key("s"), key("i")],
    "す" => [key("s"), key("u")],
    "せ" => [key("s"), key("e")],
    "そ" => [key("s"), key("o")],
    "た" => [key("t"), key("a")],
    "ち" => [key("t"), key("i")],
    "つ" => [key("t"), key("u")],
    "て" => [key("t"), key("e")],
    "と" => [key("t"), key("o")],
    "な" => [key("n"), key("a")],
    "に" => [key("n"), key("i")],
    "ぬ" => [key("n"), key("u")],
    "ね" => [key("n"), key("e")],
    "の" => [key("n"), key("o")],
    "は" => [key("h"), key("a")],
    "ひ" => [key("h"), key("i")],
    "ふ" => [key("h"), key("u")],
    "へ" => [key("h"), key("e")],
    "ほ" => [key("h"), key("o")],
    "ま" => [key("m"), key("a")],
    "み" => [key("m"), key("i")],
    "む" => [key("m"), key("u")],
    "め" => [key("m"), key("e")],
    "も" => [key("m"), key("o")],
    "や" => [key("y"), key("a")],
    "ゆ" => [key("y"), key("u")],
    "よ" => [key("y"), key("o")],
    "ら" => [key("r"), key("a")],
    "り" => [key("r"), key("i")],
    "る" => [key("r"), key("u")],
    "れ" => [key("r"), key("e")],
    "ろ" => [key("r"), key("o")],
    "わ" => [key("w"), key("a")],
    "を" => [key("w"), key("o")],
    "ん" => [key("n"), key("n")],
    "ゃ" => [key("x"), key("y"), key("a")],
    "ゅ" => [key("x"), key("y"), key("u")],
    "ょ" => [key("x"), key("y"), key("o")],
    "ぁ" => [key("x"), key("a")],
    "ぃ" => [key("x"), key("i")],
    "ぅ" => [key("x"), key("u")],
    "ぇ" => [key("x"), key("e")],
    "ぉ" => [key("x"), key("o")],
    "っ" => [key("x"), key("t"), key("u")],
    "ゎ" => [key("x"), key("w"), key("a")],
    "が" => [key("g"), key("a")],
    "ぎ" => [key("g"), key("i")],
    "ぐ" => [key("g"), key("u")],
    "げ" => [key("g"), key("e")],
    "ご" => [key("g"), key("o")],
    "ざ" => [key("z"), key("a")],
    "じ" => [key("z"), key("i")],
    "ず" => [key("z"), key("u")],
    "ぜ" => [key("z"), key("e")],
    "ぞ" => [key("z"), key("o")],
    "だ" => [key("d"), key("a")],
    "ぢ" => [key("d"), key("i")],
    "づ" => [key("d"), key("u")],
    "で" => [key("d"), key("e")],
    "ど" => [key("d"), key("o")],
    "ば" => [key("b"), key("a")],
    "び" => [key("b"), key("i")],
    "ぶ" => [key("b"), key("u")],
    "べ" => [key("b"), key("e")],
    "ぼ" => [key("b"), key("o")],
    "ぱ" => [key("p"),key("a")],
    "ぴ" => [key("p"),key("i")],
    "ぷ" => [key("p"),key("u")],
    "ぺ" => [key("p"),key("e")],
    "ぽ" => [key("p"),key("o")],
    "ヴ" => [key("v"), key("u")],
    "きゃ" => [key("k"), key("y"), key("a")],
    "きゅ" => [key("k"), key("y"), key("u")],
    "きょ" => [key("k"), key("y"), key("o")],
    "しゃ" => [key("s"), key("y"), key("a")],
    "しゅ" => [key("s"), key("y"), key("u")],
    "しょ" => [key("s"), key("y"), key("o")],
    "ちゃ" => [key("t"), key("y"), key("a")],
    "ちゅ" => [key("t"), key("y"), key("u")],
    "ちょ" => [key("t"), key("y"), key("o")],
    "にゃ" => [key("n"), key("y"), key("a")],
    "にゅ" => [key("n"), key("y"), key("u")],
    "にょ" => [key("n"), key("y"), key("o")],
    "ひゃ" => [key("h"), key("y"), key("a")],
    "ひゅ" => [key("h"), key("y"), key("u")],
    "ひょ" => [key("h"), key("y"), key("o")],
    "ぴゃ" => [key("p"), key("y"), key("a")],
    "ぴゅ" => [key("p"), key("y"), key("u")],
    "ぴょ" => [key("p"), key("y"), key("o")],
    "みゃ" => [key("m"), key("y"), key("a")],
    "みゅ" => [key("m"), key("y"), key("u")],
    "みょ" => [key("m"), key("y"), key("o")],
    "ぎゃ" => [key("g"), key("y"), key("a")],
    "ぎゅ" => [key("g"), key("y"), key("u")],
    "ぎょ" => [key("g"), key("y"), key("o")],
    "ぎぃ" => [key("g"), key("y"), key("i")],
    "ぎぇ" => [key("g"), key("y"), key("e")],
    "じゃ" => [key("z"), key("y"), key("a")],
    "じゅ" => [key("z"), key("y"), key("u")],
    "じょ" => [key("z"), key("y"), key("o")],
    "じぃ" => [key("j"), key("y"), key("i")],
    "じぇ" => [key("j"), key("y"), key("e")],
    "ぢゃ" => [key("d"), key("y"), key("a")],
    "ぢゅ" => [key("d"), key("y"), key("u")],
    "ぢょ" => [key("d"), key("y"), key("o")],
    "ぢぃ" => [key("d"), key("y"), key("i")],
    "ぢぇ" => [key("d"), key("y"), key("e")],
    "びゃ" => [key("b"), key("y"), key("a")],
    "びゅ" => [key("b"), key("y"), key("u")],
    "びょ" => [key("b"), key("y"), key("o")],
    "びぃ" => [key("b"), key("y"), key("i")],
    "びぇ" => [key("b"), key("y"), key("e")],
    "てぃ" => [key("t"), key("h"), key("i")],
    "てゅ" => [key("t"), key("h"), key("u")],
    "でぃ" => [key("d"), key("h"), key("i")],
    "でゅ" => [key("d"), key("h"), key("u")],
    "でゃ" => [key("d"), key("h"), key("a")],
    "でぇ" => [key("d"), key("h"), key("e")],
    "でょ" => [key("d"), key("h"), key("o")],
    "とぅ" => [key("t"), key("w"), key("u")],
    "どぅ" => [key("d"), key("w"), key("u")],
    "ヴぁ" => [key("v"), key("a")],
    "ヴぃ" => [key("v"), key("i")],
    "ヴぇ" => [key("v"), key("e")],
    "ヴぉ" => [key("v"), key("o")],
    "ヴゃ" => [key("v"), key("y"), key("a")],
    "ヴゅ" => [key("v"), key("y"), key("u")],
    "ヴょ" => [key("v"), key("y"), key("o")],
    "つぁ" => [key("t"), key("s"), key("a")],
    "つぃ" => [key("t"), key("s"), key("i")],
    "つぇ" => [key("t"), key("s"), key("e")],
    "つぉ" => [key("t"), key("s"), key("o")],
    "ふぁ" => [key("f"), key("a")],
    "ふぃ" => [key("f"), key("i")],
    "ふぇ" => [key("f"), key("e")],
    "ふぉ" => [key("f"), key("o")],
    "ふゅ" => [key("f"), key("y"), key("u")],
    "しぇ" => [key("s"), key("y"), key("e")],
    "ちぇ" => [key("t"), key("y"), key("e")],
    "いぇ" => [key("y"), key("e")],
    "うぁ" => [key("w"),key("h"),key("a")],
    "うぃ" => [key("w"),key("h"),key("i")],
    "うぇ" => [key("w"),key("h"),key("e")],
    "うぉ" => [key("w"),key("h"),key("o")],
    "りゃ" => [key("r"),key("y"),key("a")],
    "りぃ" => [key("r"),key("y"),key("i")],
    "りゅ" => [key("r"),key("y"),key("u")],
    "りぇ" => [key("r"),key("y"),key("e")],
    "りょ" => [key("r"),key("y"),key("o")],
    "ー" => [key("hyphen")],
    "、" => [key("comma")],
    "。" => [key("period")],
    "削除" => [key("delete_or_backspace")],
    "→" => [key("right_arrow")],
    "←" => [key("left_arrow")],
    "選→" => [key_with_shift("right_arrow")],
    "選←" => [key_with_shift("left_arrow")],
    "改行" => [key("return_or_enter")],
    "英数" => [key("lang1")],
    "かな" => [key("lang2")],
    "。改" => [key("period"),key("return_or_enter")],
  }

  module_function

  def sands
    hold_to_shift("spacebar")
  end

  def single_key(from, to)
    h = {
      "from": {"key_code": from},
      "to": KEY_MAPS[to],
      "conditions": [ input_source_if_ja ]
    }
    manipulator("#{from} = #{to}", h)
  end

  def shifted_key(from, to)
    h = {
      "from": key_with_shift(from),
      "to": KEY_MAPS[to],
      "conditions": [ input_source_if_ja ]
    }
    manipulator("#{from} + shift = #{to}", h)
  end

  def sim_keys(from_keys, to)
    h = {
      "from": simultaneous_keys(from_keys),
      "to": KEY_MAPS[to],
      "conditions": [ input_source_if_ja ]
    }
    manipulator("#{from_keys.join(" + ")} = #{to}", h)
  end

  def double_keys(from1, from2, to)
    sim_keys([from1, from2], to)
  end

  def triple_keys(from1, from2, from3, to)
    sim_keys([from1, from2, from3], to)
  end

  def shifted_double_keys(from1, from2, to)
    h = {
      "from": simultaneous_keys_with_shift([from1, from2]),
      "to": KEY_MAPS[to],
      "conditions": [ input_source_if_ja ]
    }
    manipulator("#{from1} + #{from2} + shift = #{to}", h)
  end
end
