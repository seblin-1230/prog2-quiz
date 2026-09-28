class Question
  attr_reader :prompt, :answer
  def initialize(prompt, answer)
    raise ArgumentError, "prompt cannot be empty" if prompt.empty?
    raise ArgumentError, "answer cannot be empty" if answer.empty?
    @prompt = prompt
    @answer = answer
  end

  def hint
    @answer[0]
  end

  def ask
    puts prompt
    gets.chomp
  end

  def correct?(reply)
    reply.strip.downcase == answer.downcase
  end

  def to_s
    "#{prompt} (#{answer})"
  end
end
