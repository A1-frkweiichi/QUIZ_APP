class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[show edit update destroy]

  # GET /quizzes or /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1 or /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes or /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quiz_url(@quiz), notice: "Quiz was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quizzes/1 or /quizzes/1.json
  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_url(@quiz), notice: "Quiz was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quizzes/1 or /quizzes/1.json
  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: "Quiz was successfully destroyed."
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :content, :image)
  end
end
