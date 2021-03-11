class TechnoController < ApplicationController
    include ActionController::Cookies
    before_action :restrict_access, only: %i[create, update]

    def create
        techno = Techno.create(techno_name: params[:techno_name], techno_status: params[:techno_status], user_id: cookies[:id])
        if techno.valid?
          techno.save
          render json: techno.as_json(only: %i[id techno_name]), status: :created
        else
          render json: techno.errors.messages, status: :conflict
        end
    end

    def update
      begin
        techno = Techno.find(params[:id])
        techno.techno_name = params[:techno_name]
        techno.techno_status = params[:techno_status]
        techno.save
      rescue => exception
        render json: {'error': exception}, status: :bad_request
      else
        render json: techno.as_json, status: :accepted
      end
  end
end
