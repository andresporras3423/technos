class UserController < ApplicationController
    def index
        render json: {"test": "successful","this": "is a JSON"}, status: :ok
      end

      def create
        user = User.create(username: params[:username], email: params[:email], password: params[:password],
                           password_confirmation: params[:password_confirmation])
        if user.valid?
          user.save
          render json: user.as_json(only: %i[id email username]), status: :created
        else
          render json: user.errors.messages, status: :conflict
        end
      end
end
