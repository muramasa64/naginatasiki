#/usr/bin/env ruby

require_relative './lib/naginatasiki.rb'

include NaginataSiki

manipulators = [
  # Space and Shift
  sands,
  # triple keys（拗音 + 濁音）
  triple_keys("o", "h", "s", "ぎゃ"),
  triple_keys("o", "h", "r", "ぎゅ"),
  triple_keys("o", "h", "c", "ぎょ"),
  triple_keys("p", "h", "s", "じゃ"),
  triple_keys("p", "h", "r", "じゅ"),
  triple_keys("p", "h", "c", "じょ"),
  triple_keys("i", "h", "s", "ぢゃ"),
  triple_keys("i", "h", "r", "ぢゅ"),
  triple_keys("i", "h", "c", "ぢょ"),
  triple_keys("q", "h", "s", "びゃ"),
  triple_keys("q", "h", "r", "びゅ"),
  triple_keys("q", "h", "c", "びょ"),
  triple_keys("q", "m", "s", "ぴゃ"),
  triple_keys("q", "m", "r", "ぴゅ"),
  triple_keys("q", "m", "c", "ぴょ"),
  # double key（制御）
  double_keys("k", "m", "改行"),
  double_keys("d", "h", "かな", false),
  double_keys("u", "i", "英数", false),
  # double key (濁音)
  # left 1
  double_keys("h", "comma", "ば"),
  double_keys("h", "period", "で"),
  double_keys("h", "p", "じ"),
  # left 2
  double_keys("h", "a", "ぜ"),
  double_keys("h", "o", "ぎ"),
  double_keys("h", "e", "ど"),
  double_keys("h", "u", "が"),
  double_keys("h", "i", "ぢ"),
  # left 3
  double_keys("h", "semicolon", "ぼ"),
  double_keys("h", "q", "び"),
  double_keys("h", "j", "げ"),
  double_keys("h", "k", "ご"),
  double_keys("h", "x", "ぞ"),
  # right 1
  double_keys("u", "g", "ざ"),
  double_keys("u", "r", "ず"),
  double_keys("u", "l", "べ"),
  # right 2
  double_keys("u", "d", "ぐ"),
  double_keys("u", "n", "づ"),
  # right 3
  double_keys("u", "b", "だ"),
  double_keys("u", "v", "ぶ"),
  # double key (半濁音)
  # left 1
  double_keys("m", "comma", "ぱ"),
  # left 3
  double_keys("m", "semicolon", "ぽ"),
  double_keys("m", "q", "ぴ"),
  # right 1
  double_keys("m", "l", "ぺ"),
  # right 3
  double_keys("u", "v", "ぷ"),
  # double key（拗音）
  double_keys("o", "s", "きゃ"),
  double_keys("o", "r", "きゅ"),
  double_keys("o", "c", "きょ"),
  double_keys("p", "s", "しゃ"),
  double_keys("p", "r", "しゅ"),
  double_keys("p", "c", "しょ"),
  double_keys("i", "s", "ちゃ"),
  double_keys("i", "r", "ちゅ"),
  double_keys("i", "c", "ちょ"),
  double_keys("e", "s", "にゃ"),
  double_keys("e", "r", "にゅ"),
  double_keys("e", "c", "にょ"),
  double_keys("q", "s", "ひゃ"),
  double_keys("q", "r", "ひゅ"),
  double_keys("q", "c", "ひょ"),
  double_keys("comma", "s", "みゃ"),
  double_keys("comma", "r", "みゅ"),
  double_keys("comma", "c", "みょ"),
  double_keys("period", "s", "りゃ"),
  double_keys("period", "r", "りゅ"),
  double_keys("period", "c", "りょ"),
  # double key（小書き）,
  shifted_double_keys("h", "k", "ぁ"),
  shifted_double_keys("t", "k", "ぃ"),
  shifted_double_keys("n", "k", "ぅ"),
  shifted_double_keys("l", "k", "ぇ"),
  shifted_double_keys("b", "k", "ぉ"),
  shifted_double_keys("s", "k", "ゃ"),
  shifted_double_keys("r", "k", "ゅ"),
  shifted_double_keys("c", "k", "ょ"),
  shifted_double_keys("d", "k", "ゎ"),
  # double key (外来音)
  double_keys("comma", "h", "ヴぁ"),
  double_keys("comma", "t", "ヴぃ"),
  double_keys("comma", "l", "ヴぇ"),
  double_keys("comma", "b", "ヴぉ"),
  double_keys("comma", "r", "ヴゅ"),
  double_keys("period", "t", "てぃ"),
  double_keys("e", "n", "とぅ"),
  shifted_double_keys("period", "r", "てゅ"),
  double_keys("p", "l", "しぇ"),
  double_keys("i", "l", "ちぇ"),
  double_keys("v", "h", "ふぁ"),
  double_keys("v", "t", "ふぃ"),
  double_keys("v", "r", "ふゅ"),
  double_keys("v", "l", "ふぇ"),
  double_keys("v", "b", "ふぉ"),
  double_keys("n", "t", "うぃ"),
  double_keys("n", "l", "うぇ"),
  double_keys("n", "b", "うぉ"),
  double_keys("period", "t", "りぃ"),
  double_keys("period", "l", "りぇ"),
  shifted_double_keys("n", "h", "つぁ"),
  shifted_double_keys("n", "t", "つぃ"),
  shifted_double_keys("n", "l", "つぇ"),
  shifted_double_keys("n", "b", "つぉ"),
  # shifted key
  # left 1
  # shifted_key("quote", ""),
  shifted_key("comma", "み"),
  shifted_key("period", "り"),
  shifted_key("p", "め"),
  # shifted_key("y", ""),
  # left 2
  shifted_key("a", "せ"),
  shifted_key("o", "ね"),
  shifted_key("e", "に"),
  shifted_key("u", "ま"),
  shifted_key("i", "ち"),
  # left 3
  # shifted_key("semicolon", ""),
  # shifted_key("q", ""),
  shifted_key("j", "を"),
  shifted_key("k", "、"),
  shifted_key("x", "ぬ"),
  # right 1
  # shifted_key("f", ""),
  shifted_key("g", "さ"),
  shifted_key("c", "よ"),
  shifted_key("r", "ゆ"),
  shifted_key("l", "え"),
  # right 2
  shifted_key("d", "わ"),
  shifted_key("h", "の"),
  shifted_key("t", "も"),
  shifted_key("n", "つ"),
  shifted_key("s", "や"),
  # right 3
  shifted_key("b", "お"),
  shifted_key("m", "。改"),
  shifted_key("w", "む"),
  shifted_key("v", "ふ"),
  # shifted_key("z", ""),
  # single key
  # left 1
  single_key("quote", "ヴ"),
  single_key("comma", "は"),
  single_key("period", "て"),
  single_key("p", "し"),
  single_key("y", "←"),
  # left 2
  single_key("a", "ろ"),
  single_key("o", "き"),
  single_key("e", "と"),
  single_key("u", "か"),
  single_key("i", "っ"),
  # left 3
  single_key("semicolon", "ほ"),
  single_key("q", "ひ"),
  single_key("j", "け"),
  single_key("k", "こ"),
  single_key("x", "そ"),
  # right 1
  single_key("f", "→"),
  single_key("g", "削除"),
  single_key("c", "る"),
  single_key("r", "す"),
  single_key("l", "へ"),
  # right 2
  single_key("d", "く"),
  single_key("h", "あ"),
  single_key("t", "い"),
  single_key("n", "う"),
  single_key("s", "ー"),
  # right 3
  single_key("b", "た"),
  single_key("m", "な"),
  single_key("w", "ん"),
  single_key("v", "ら"),
  single_key("z", "れ"),
]

puts generate("薙刀式（v11）", "薙刀式テスト for Dvorak", manipulators)
