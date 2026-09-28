require "minitest/autorun"
require_relative "../multiple_choice"

class MultipleChoiceTest < Minitest::Test
  def test_rejects_empty_alternatives
    assert_raises(ArgumentError) {MultipleChoice.new("A random prompt", [], "Correct Answer")}
  end

  def test_rejects_non_strings_in_alternatives
    assert_raises(ArgumentError) {MultipleChoice.new("A random prompt", ["Incorrect Answer", 5, "Correct Answer", "Incorrect Answer"], "Correct Answer")}
  end

  def test_rejects_empty_strings_in_alternatives
    assert_raises(ArgumentError) {MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", ""], "Correct Answer")}
  end

  def test_rejects_empty_answer
    assert_raises(ArgumentError) {MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "")}
  end

  def test_requires_answer_be_in_alternatives
    assert_raises(ArgumentError) {MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Incorrect Answer", "Incorrect Answer"], "Correct Answer")}
  end

  def test_prompt_can_be_read
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_equal q.prompt, "A random prompt"
  end

  def test_prompt_cant_be_written
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_raises(NoMethodError) {q.prompt = "Another prompt"}
  end

  def test_alternatives_can_be_read
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_equal q.alternatives, ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"]
  end

  def test_alternatives_cant_be_written
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_raises(NoMethodError) {q.alternatives = ["A Very Incorrect Answer"]}
  end

  def test_answer_can_be_read
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_equal q.answer, "Correct Answer"
  end

  def test_answer_cant_be_written
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_raises(NoMethodError) {q.answer = "Incorrect Answer"}
  end

  def test_correct_rejects_non_integer_reply
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_raises(ArgumentError) {q.correct?("2")}
  end

  def test_correct_accepts_correct_answer
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert q.correct?(2)
  end

  def test_correct_rejects_incorrect_answer
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    refute q.correct?(1)
  end

  def test_correct_rejects_to_big_reply
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_raises(ArgumentError) {q.correct?(4)}
  end

  def test_correct_rejects_to_small_reply
    q = MultipleChoice.new("A random prompt", ["Incorrect Answer", "Incorrect Answer", "Correct Answer", "Incorrect Answer"], "Correct Answer")
    assert_raises(ArgumentError) {q.correct?(-1)}
  end
end
