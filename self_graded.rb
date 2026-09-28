require_relative "question"

class SelfGraded < Question
  def initialize(prompt, answer)
    super(prompt, answer)
  end
  
  def get_reply
    puts prompt
    puts "Tänk ut svaret och tryck Enter."
    gets.chomp

    puts "Svar: #{answer}"
    puts "Hade du rätt (j/n)"

    gets.chomp
  end

  def ask  
    reply = get_reply
    
    if correct?(reply)
      puts "Bra gjort!"

      true
    else
      puts "Synd! Bättre lycka nästa gång!"

      false
    end
  end

  def correct?(reply)
    reply.strip.downcase == "j"
  end
end