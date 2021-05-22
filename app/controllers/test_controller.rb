class TestController < ApplicationController
    before_action :restrict_access, only: %i[create get]

    def create
        begin
          test = Test.new(correct: params[:correct], total: params[:total], user_id: @user.id)
          if test.valid?
            test.save
            render json: test.as_json(only: %i[id]), status: :created
          else
            render json: test.errors.messages, status: :conflict
          end
        rescue => exception
            render json: exception, status: :bad_request
        end
    end

    def get
      begin
      user_tests=[]
      user_tests=Test.where("user_id=#{@user.id}").order("created_at desc")
      rescue => exception
        render json: {'error': exception}, status: :bad_request
      else
        render json: user_tests.as_json, status: :accepted
      end
    end
end