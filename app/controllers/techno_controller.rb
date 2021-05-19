class TechnoController < ApplicationController
    before_action :restrict_access, only: %i[create update get search delete]

    def create
        techno = Techno.new(techno_name: params[:techno_name], techno_status: params[:techno_status], user_id: @user.id)
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
      filter = params[:sort_by_name] ? 'techno_name' : 'created_at'
      user_technos=[]
      user_technos=Techno.where("user_id=#{@user.id} and techno_status=true").order(filter)
      render json: user_technos.as_json, status: :accepted
    end

    def search
      filter = params[:sort_by_name] ? 'techno_name' : 'created_at'
      user_technos=[]
      if params[:search]==1
        user_technos=Techno.where("user_id=#{@user.id}
          and ('#{params[:techno_name]}'='' or techno_name LIKE '%#{params[:techno_name]}%')
          and (#{@@status[params[:techno_status]]} is NULL or #{@@status[params[:techno_status]]}==techno_status)
          ").order(filter)
      elsif params[:search]==2
        user_technos=Techno.where("user_id=#{@user.id}
            and ('#{params[:techno_name]}'='' or techno_name LIKE '#{params[:techno_name]}%')
            and (#{@@status[params[:techno_status]]} is NULL or #{@@status[params[:techno_status]]}==techno_status)
        ").order(filter)
      elsif params[:search]==3
        user_technos=Techno.where("user_id=#{@user.id}
            and ('#{params[:techno_name]}'='' or techno_name LIKE '%#{params[:techno_name]}')
            and (#{@@status[params[:techno_status]]} is NULL or #{@@status[params[:techno_status]]}==techno_status)
        ").order(filter)
      elsif  params[:search]==4
        user_technos=Techno.where("user_id=#{@user.id}
            and ('#{params[:techno_name]}'='' or techno_name = '#{params[:techno_name]}')
          and (#{@@status[params[:techno_status]]} is NULL or #{@@status[params[:techno_status]]}==techno_status)
            ").order(filter)
      end
      render json: user_technos.as_json, status: :accepted
    end

    def delete
      techno_to_delete = Techno.find(params[:id])
      if techno_to_delete
        techno_to_delete.destroy
        render json: {"deleted_id": params[:id]}, status: :accepted
      else
        render json: {"error": "techno with id #{params[:id]} doesn't exists"}, status: :not_found
      end
    end
end
