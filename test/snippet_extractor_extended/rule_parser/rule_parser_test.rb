require "test_helper"

module SnippetExtractorExtended
  class RuleParserTest < Minitest::Test

    def test_empty_file_brings_empty_rule_list
      # Given
      rule_text =
        %{}

      # When
      rule_list = RuleParser.(rule_text)

      # Then
      assert_equal [], rule_list
    end

    def test_word_creates_simple_rule_with_word
      # Given
      rule_text =
        %q{word
        }

      # When
      rule_list = RuleParser.(rule_text)

      # Then
      assert_equal [SimpleRule.new('word', '')], rule_list
    end

    def test_partial_word_creates_simple_rule_with_partial_modifier
      # Given
      rule_text =
        %q{word\p
        }

      # When
      rule_list = RuleParser.(rule_text)

      # Then
      assert_equal [SimpleRule.new('word','p')], rule_list
    end

    def test_just_word_creates_simple_rule_with_just_modifier
      # Given
      rule_text =
        %q{word\j
        }

      # When
      rule_list = RuleParser.(rule_text)

      # Then
      assert_equal [SimpleRule.new('word','j')], rule_list
    end

    def test_just_partial_word_creates_simple_rule_with_just_and_partial_modifiers
      # Given
      rule_text =
        %q{word\pj
        }

      # When
      rule_list = RuleParser.(rule_text)

      # Then
      assert_equal [SimpleRule.new('word','pj')], rule_list
    end

  end
end
