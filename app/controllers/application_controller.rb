class ApplicationController < ActionController::API
    include ActionController::Cookies
    @user = nil

  def restrict_access
    puts cookies[:id]
    @user = User.find(cookies[:id])
    unless @user
      @user = nil
      render json: { "error": 'you must be logged to do this action' }, status: :unauthorized
    end
  end
end
