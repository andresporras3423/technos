class SessionController < ApplicationController
    def create
        user = User.find_by_email(params[:email])
        if user&.authenticate(params[:password])
          cookies[:id]=user.id
          render json: user.as_json(only: %i[id email username]), status: :created
        else
          head(:unauthorized)
        end
      end

      def destroy
        cookies.delete :id
        render json: {'status': 'session successfully closed'}, status: :accepted
      end
end
