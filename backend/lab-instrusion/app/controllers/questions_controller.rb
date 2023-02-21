class QuestionsController < ApplicationController
  # GET /questions
  def index
    render json: Question.all,
           status: :ok
  end

  # POST /questions
  def create
    new_question = Question.new(question_params)

    ActiveRecord::Base.transaction do
      new_question.save!

      # paints を1つずつ作る
      paint_params.each do |paint_param|
        Paint.create!(paint_param.merge(question: new_question))
      end
    end

    render json: new_question,
           status: :created

  rescue StandardError => e
    render json: { error: 'failed to create question', data: e }, status: :bad_request
  end


  # GET /questions/:id
  def show
    render json: Question.find(params[:id]),
           status: :ok
  end

  private

  def question_params
    params
    .require(:question)
    .permit([:answer, :difficulty, :nickname])
  end

  def paint_params
    params
    .require(:question)
    .permit(paints: [:target, :painted_count])
    .require(:paints)
  end
end