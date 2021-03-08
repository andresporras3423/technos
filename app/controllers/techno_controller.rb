class TechnoController < ApplicationController
    include ActionController::Cookies
    before_action :restrict_access, only: %i[create]

    def create
        techno = Techno.create(techno_name: params[:techno_name], techno_status: params[:techno_status], user_id: params[:user_id])
        if techno.valid?
          techno.save
          render json: techno.as_json(only: %i[id techno_name]), status: :created
        else
          render json: techno.errors.messages, status: :conflict
        end
      end
end
