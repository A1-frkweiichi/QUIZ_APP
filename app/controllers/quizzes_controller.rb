class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[show edit update destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
  end

  def new
    @quiz = Quiz.new
    4.times { @quiz.choices.build }
  end

  def edit
    (4 - @quiz.choices.count).times { @quiz.choices.build }
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quiz_url(@quiz), notice: t(".success")
    else
      # 既存の選択肢を保持したまま、残りの選択肢をbuildする
      build_remaining_choices
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_url(@quiz), notice: t(".success")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: t(".success")
  end

  private

  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :content, :image, choices_attributes: [:id,
                                                                                :content,
                                                                                :image,
                                                                                :is_correct,
                                                                                :_destroy])
  end

  # 既存の選択肢を保持したまま、残りの選択肢をbuildする
  def build_remaining_choices
    unbuilt_choices = [4 - @quiz.choices.size, 0].max
    unbuilt_choices.times { @quiz.choices.build }
  end
end
