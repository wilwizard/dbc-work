class AnswersController < ApplicationController
  
  before_filter :authenticate_user, :only => [:create, :new] 

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @question= Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer: params[:answer][:answer],
                           user_id: current_user.id, 
                       question_id: params[:question_id])
    # if @answer.save
      redirect_to question_path(params[:question_id]), alert: "Thanks for answering this question!"
  #   else
  #     render :new
  #   end
  end


  def assign_best_answer
    p params
    @answer = Answer.find(params[:answer_id])
    @question = @answer.question
    @question.best_answer=@answer
    redirect_to :back
  end

end
