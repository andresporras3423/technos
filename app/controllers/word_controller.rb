class WordController < ApplicationController
    include ActionController::Cookies
    before_action :restrict_access, only: %i[create, update, get, search, delete]

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

    def get
      user_technos=[]
      if params[:sort_by_name]
        user_technos=Techno.where("user_id=#{cookies[:id]} and techno_status=true").order('techno_name')
      else
        user_technos=Techno.where("user_id=#{cookies[:id]} and techno_status=true").order('created_at')
      end
      render json: user_technos.as_json, status: :accepted
    end

    def search
      user_technos=[]
      if params[:sort_by_name]==true
        user_technos=Techno.where("user_id=#{cookies[:id]}
          and ('#{params[:techno_name]}'=='' or '#{params[:techno_name]}'==techno_name)
          and (#{@@status[params[:techno_status]]} is NULL or #{@@status[params[:techno_status]]}==techno_status)
          ").order('techno_name')
      else
        user_technos=Techno.where("user_id=#{cookies[:id]}
          and ('#{params[:techno_name]}'=='' or '#{params[:techno_name]}'==techno_name)
          and (#{@@status[params[:techno_status]]} is NULL or #{@@status[params[:techno_status]]}==techno_status)
          ").order('created_at')
      end
      render json: user_technos.as_json, status: :accepted
    end

    def delete
      techno_to_delete = Techno.find(params[:id])
      if techno_to_delete
        techno_to_delete.destroy
        render json: {"deleted_id":params[:id]}, status: :accepted
      else
        render json: {"error": "techno with id #{params[:id]} doesn't exists"}, status: :not_found
      end
    end
end