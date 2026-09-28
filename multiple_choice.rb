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
    raise ArgumentError if reply.empty?

    int_reply = Integer(reply) - 1

    raise ArgumentError if int_reply > @alternatives.length
    raise ArgumentError if int_reply < 0

    alternatives[int_reply] == answer
  end

  def get_reply
    puts prompt

    alternatives.each_with_index do |alternative, i|
      puts "#{i+1}: #{alternative}"
    end

    gets.chomp
  end

  def hint
    "Inga tips tillgängliga"
  end
end