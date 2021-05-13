class SessionController < ApplicationController
  include ActionController::Cookies
    def create
        user = User.find_by_email(params[:email])
        if user&.authenticate(params[:password])
          cookies[:id]=user.id
          render json: {"cookie": cookies[:id]}, status: :created
        else
          head(:unauthorized)
        end
      end

      def destroy
        cookies.delete :id
        render json: {'status': 'session successfully closed'}, status: :accepted
      end
end
