require_relative "question"
require_relative "multiple_choice"
require_relative "true_or_false"
require_relative "numeric_question"
require_relative "self_graded"
require 'sqlite3'


class Quiz
  attr_reader :questions, :db
  def initialize(db_path)
    @db = SQLite3::Database.new(db_path)
    @db.results_as_hash = true

    result = @db.execute('SELECT * FROM questions')
    
    @questions = result.map do |res|
      if res["type"] == "Question" 
        Question.new(res["prompt"], res["answer"])
      elsif res["type"] == "Multi"
        alternatives = res["alternatives"].split(", ")
        MultipleChoice.new(res["prompt"], alternatives, res["answer"])
      elsif res["type"] == "TrueOrFalse"
        TrueOrFalse.new(res["prompt"], res["answer"].downcase == "true")
      elsif res["type"] == "Numeric"
        NumericQuestion.new(res["prompt"], res["answer"].to_f)
      elsif res["type"] = "SelfGraded"
        SelfGraded.new(res["prompt"], res["answer"])
      end
    end

    # @questions = questions
  end

  def run()
    score = 0

    questions.each do |q|
      if q.ask
        score += 1
      end
    end

  puts "#{score} av #{questions.length} rätt."
  end
end

# questions = [
#   Question.new("Vad heter huvudstaden av Norge?", "Oslo"),
#   Question.new("Vilket år släpptes ruby 1.0", "1996"),
#   Question.new("Vad svarar 5.class", "Integer"),
#   MultipleChoice.new("När släpptes ruby 1.2", ["1997", "1998", "1999"], "1998"),
#   TrueOrFalse.new("Året är 2026", true),
#   TrueOrFalse.new("Året är 2025", false),
#   NumericQuestion.new("15+3", 18),
#   SelfGraded.new("Förklara inkapsling med en mening.", "Objektet bestämmer själv vad som går att nå utifrån.")
# ]

quiz = Quiz.new("quiz.db")
quiz.run()