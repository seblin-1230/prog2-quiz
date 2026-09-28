require_relative "question"

class MultipleChoice < Question
  attr_reader :alternatives
  def initialize(prompt, alternatives, answer)
    super(prompt, answer)
    raise ArgumentError if alternatives.empty?
    raise ArgumentError unless alternatives.include?(answer)
    alternatives.each do |alternative|
      raise ArgumentError unless alternative.is_a?(String)
      raise ArgumentError if alternative.empty?
    end


    @alternatives = alternatives
  end

  def correct?(reply)
    raise ArgumentError unless reply.is_a?(Integer)
    raise ArgumentError if reply > @alternatives.length
    raise ArgumentError if reply < 0

    alternatives[reply] == answer
  end

  def ask 
    puts prompt

    alternatives.each_with_index do |alternative, i|
      puts "#{i+1}: #{alternative}"
    end

    reply = gets.chomp
    Integer(reply) - 1
  end

  def hint
    "Inga tips tillgängliga"
  end
end