require "minitest/autorun"
require_relative "../true_or_false"

class TrueOrFalseTest < Minitest::Test
  def test_rejects_non_boolean_answers
    assert_raises(ArgumentError) {TrueOrFalse.new("The answer is true", "true")}
  end

  def test_correct_rejects_non_strings
    q = TrueOrFalse.new("The answer is true", true)
    assert_raises(ArgumentError) {q.correct?(true)}
  end

  def test_correct_returns_false_if_incorrect
    q = TrueOrFalse.new("The answer is true", true)
    refute q.correct?("falskt")
  end

  def test_correct_returns_true_if_correct
    q = TrueOrFalse.new("The answer is true", true)
    assert q.correct?("sant")
  end
end
