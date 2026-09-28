require "minitest/autorun"
require_relative "../self_graded"

class SelfGradedTest < Minitest::Test
  def test_correct
    q = SelfGraded.new("Är svaret sant", "sant")
    assert(q.correct?("j"))
    assert(!q.correct?("n"))
  end
end
