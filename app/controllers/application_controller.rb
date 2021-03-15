class ApplicationController < ActionController::API
    include ActionController::Cookies
    @user = nil
    @@status = Hash.new
    @@status[nil]='NULL';
    @@status[true]='true';
    @@status[false]='false';


  def restrict_access
    begin
      @user = User.find(cookies[:id])
    rescue => exception
      render json: { "error": 'you must be logged to do this action' }, status: :unauthorized
    end
  end
end
