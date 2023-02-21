class TrialsController < ApplicationController
  # POST /trials
  def create
    new_trial = Trial.new(create_params)
    
    if new_trial.save
      render json: new_trial,
             status: :created
    
    else
      render json: { error: 'failed to create trial', data: new_trial.errors }, status: :bad_request
    end
  end

  private

  def create_params
    params
    .require(:trial)
    .permit([:question_id, :count, :nickname, :solved])
  end
end