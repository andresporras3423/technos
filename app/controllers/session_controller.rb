class SessionController < ApplicationController
  before_action :restrict_access, only: %i[destroy]

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      user.record_signup
      user.save
      render json: user.as_json(only: %i[id email name remember_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    @user.update(remember_token: nil)
    render json: {"status": 201}, status: :accepted
  end
end