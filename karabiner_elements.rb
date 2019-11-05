require "json"

module KarabinerElements
  module KeyCode
    SPACE = "spacebar"
  end

  def self.input_source_if(language)
    {
      "type" => "input_source_if",
      "input_sources" => [
        {
          "language": language
        }
      ]
    }
  end

  def self.input_source_if_ja
    input_source_if("ja")
  end

  def self.base(title, description, manipulators)
    {
      "title" => title,
      "rules" => [
        {
          "description" => description,
          "manipulators" => manipulators
        }
      ]
    }
  end

  def self.hold_to_shift(key_code)
    {
      "type": "basic",
      "from": {
        "key_code": key_code,
        "modifiers": {
          "optional": [
            "any"
          ]
        }
      },
      "to": [
        {
          "key_code": "left_shift"
        }
      ],
      "to_if_alone" => [
        {
          "key_code": key_code
        }
      ]
    }
  end

  def self.generate(title, description, manipulators)
    JSON.pretty_generate(base(title, description, manipulators))
  end
end
