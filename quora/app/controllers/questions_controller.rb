class QuestionsController < ApplicationController
  before_filter :authenticate_user, :only => [:new, :create]

  def index
    @questions = Question.all.sort_by(&:created_at).reverse
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    @question.user_id = current_user.id
    if @question.save
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def sort
    @questions = Question.send(params[:sort_method].to_sym)
    respond_to do |format| 
      format.html { render :index, :layout => false}
      format.json { @questions.to_json }
    end
  end
end
