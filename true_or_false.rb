require_relative "question"

class TrueOrFalse < Question
  def initialize(prompt, answer)
    raise ArgumentError unless answer.is_a?(TrueClass) or answer.is_a?(FalseClass)
    converted_answer = nil

    if answer 
      converted_answer = "sant"
    else
        converted_answer = "falskt"
    end
    
    super(prompt, converted_answer)
  end

  def correct?(reply)
    raise ArgumentError unless reply.is_a?(String)
    answer == reply
  end

  def get_reply
    puts "#{prompt} (sant/falskt)"
    gets.chomp
  end

  def hint
    "Inga tips tillgängliga"
  end
end