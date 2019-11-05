require "json"

module KarabinerElements
  module_function

  def input_source_if(language)
    {
      "type" => "input_source_if",
      "input_sources" => [
        {
          "language": language
        }
      ]
    }
  end

  def input_source_if_ja
    input_source_if("ja")
  end

  def base(title, description, manipulators)
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

  def hold_to_shift(key_code)
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

  def key(key_code)
    {
      "key_code": key_code,
      "repeat": false
    }
  end

  def key_with_shift(key_code)
    {
      "key_code": key_code,
      "modifiers": {
        "mandatory": [
          "shift"
        ]
      }
    }
  end

  def simultaneous_keys(from_keys)
    {
      "simultaneous": from_keys.map {|k| {"key_code": k}}
    }
  end

  def simultaneous_keys_with_shift(from_keys)
    {
      "simultaneous": from_keys.map {|k| {"key_code": k}},
      "modifiers": {
        "mandatory": [
          "shift"
        ]
      }
    }
  end

  def manipulator(description, options = {})
    h = {
      "description": description,
      "type": "basic",
    }
    options.map {|k, v| h[k] = v }
    h
  end

  def generate(title, description, manipulators)
    JSON.pretty_generate(base(title, description, manipulators))
  end
end
