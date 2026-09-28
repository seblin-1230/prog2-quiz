require "minitest/autorun"
require_relative "../numeric_question"

class NumericQuestionTest < Minitest::Test
  def test_whole_number
    q = NumericQuestion.new("Hur många dagar har en vecka?", 7)
    assert q.correct?("7")
    refute q.correct?("8")
  end

  def test_close_enough_counts
    q = NumericQuestion.new("Vad är pi, med två decimaler?", 3.14159)
    assert q.correct?("3.14")
    refute q.correct?("3.2")
  end

  def test_decimal_comma
    q = NumericQuestion.new("Vad är pi, med två decimaler?", 3.14159)
    assert q.correct?("3,14")
  end

  def test_computed_answer
    q = NumericQuestion.new("Vad är 0,1 + 0,2?", 0.1 + 0.2)
    assert q.correct?("0.3")
  end
end