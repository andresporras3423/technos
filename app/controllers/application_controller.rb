class ApplicationController < ActionController::API
    include ActionController::Cookies
    @user = nil

  def restrict_access
    begin
      @user = User.find(cookies[:id])
    rescue => exception
      render json: { "error": 'you must be logged to do this action' }, status: :unauthorized
    end
  end
end
