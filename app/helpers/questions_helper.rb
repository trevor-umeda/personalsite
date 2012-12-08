module QuestionsHelper
  def unanswered_questions
    @unanswered_questions = Question.where("answer IS null").count.to_s
    @portfolio_link = "Portfolio(" + @unanswered_questions + ")"
    return @portfolio_link
  end
end
