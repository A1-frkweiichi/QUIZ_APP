class QuizzesController < ApplicationController
  before_action :set_quiz, only: %i[edit update destroy]

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def new
    @quiz = current_user.quizzes.new
    build_choices
  end

  def edit
    build_choices
  end

  def create
    @quiz = current_user.quizzes.new(quiz_params)
    if @quiz.save
      redirect_to quiz_url(@quiz), notice: t(".success")
    else
      build_choices
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to quiz_url(@quiz), notice: t(".success")
    else
      build_choices
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: t(".success"), status: :see_other
  end

  def explanation
    @quiz = Quiz.find(params[:id])
  end

  def record_answer
    @quiz = Quiz.find(params[:id])
    @choice = Choice.find(params[:choice_id])
    @user = current_user

    Answer.create!(quiz: @quiz, choice: @choice, user: @user)

    redirect_to explanation_path(@quiz, choice_id: @choice.id)
  end

  private

  def set_quiz
    @quiz = current_user.quizzes.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title,
                                 :content,
                                 :quiz_image,
                                 :explanation,
                                 :explanation_image,
                                 :category,
                                 :level,
                                 choices_attributes:
                                                   [:id,
                                                    :content,
                                                    :choice_image,
                                                    :is_correct,
                                                    :explanation,
                                                    :explanation_image,
                                                    :_destroy])
  end

  def build_choices
    unbuilt_choices = [4 - @quiz.choices.size, 0].max
    unbuilt_choices.times { @quiz.choices.build }
  end
end
