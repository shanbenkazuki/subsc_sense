class QuizAnswersController < ApplicationController
  before_action :set_quiz_answer, only: %i[ show edit update destroy ]

  # GET /quiz_answers
  def index
    @quiz_answers = QuizAnswer.includes(:quiz).all
  end

  # GET /quiz_answers/1
  def show
    # @quiz_answer = QuizAnswer.new
  end

  # GET /quiz_answers/new
  def new
    quiz_answer = QuizAnswer.new
    @quizzes = Quiz.all
  end

  # GET /quiz_answers/1/edit
  def edit
  end

  # POST /quiz_answers
  def create
    binding.pry
    quiz_answer = QuizAnswer.new(quiz_id: params[:quiz_id], user_id: current_user.id)
    quizzes = Quiz.all
    if quiz_answer.save
      redirect_to quiz_answer, notice: "Quiz answer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quiz_answers/1
  def update
    if @quiz_answer.update(quiz_answer_params)
      redirect_to quiz_answers_path, notice: "Quiz answer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quiz_answers/1
  def destroy
    @quiz_answer.destroy
    redirect_to quiz_answers_url, notice: "Quiz answer was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_answer
      @quiz_answer = QuizAnswer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quiz_answer_params
      params.require(:quiz_answer).permit(:price)
    end
end
