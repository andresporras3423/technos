class SessionController < ApplicationController

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
    render json: @user.errors.messages, status: :accepted
  end
end