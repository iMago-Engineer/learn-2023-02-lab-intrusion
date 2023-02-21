module Questions
  class TrialsController < ApplicationController
    # GET /questions/:question_id/trials
    def index
      debugger
      render json: Question.find_by(id: params[:question_id]).trials,
            status: :ok
    end

    private

    def create_params
      params
      .require(:trial)
      .permit([:question_id, :count, :nickname, :solved])
    end
  end
end