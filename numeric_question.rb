require_relative "question"

class NumericQuestion < Question
  def initialize(prompt, answer)
    raise ArgumentError, "prompt cannot be empty" if prompt.empty?
    @prompt = prompt
    @answer = answer
  end

  def correct?(reply)
    reply.to_f <= answer + 0.01 &&  reply.to_f >= answer - 0.01
  end

  def hint
    "Inga tips tillgängliga"
  end
end