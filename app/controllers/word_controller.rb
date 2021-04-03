class WordController < ApplicationController
    include ActionController::Cookies
    before_action :restrict_access, only: %i[create, update, get, search, delete]

    def create
        word = Word.create(techno_id: params[:techno_id], word: params[:word], translation: params[:translation], user_id: cookies[:id])
        if word.valid?
            word.save
          render json: word.as_json(only: %i[id word]), status: :created
        else
          render json: word.errors.messages, status: :conflict
        end
    end

    def update
      begin
        word = Word.find(params[:id])
        word.word = params[:word]
        word.translation = params[:translation]
        word.techno_id = params[:techno_id]
        word.save
      rescue => exception
        render json: {'error': exception}, status: :bad_request
      else
        render json: word.as_json, status: :accepted
      end
    end

    def search
      user_words=[]
      if params[:sort_by_word]==true
        user_words=Word.where("user_id=#{cookies[:id]}
          and ('#{params[:word]}'=='' or '#{params[:word]}'==word)
          and ('#{params[:translation]}'=='' or '#{params[:translation]}'==translation)
          and ('#{params[:techno_id]}'==-1 or '#{params[:techno_id]}'==techno_id)
          ").order('word')
      else
        user_words=Word.where("user_id=#{cookies[:id]}
            and ('#{params[:word]}'=='' or '#{params[:word]}'==word)
            and ('#{params[:translation]}'=='' or '#{params[:translation]}'==translation)
            and ('#{params[:techno_id]}'==-1 or '#{params[:techno_id]}'==techno_id)
            ").order('created_at')
      end
      render json: user_words.as_json, status: :accepted
    end

    def delete
      word_to_delete = Word.find(params[:id])
      if word_to_delete
        word_to_delete.destroy
        render json: {"deleted_id":params[:id]}, status: :accepted
      else
        render json: {"error": "word with id #{params[:id]} doesn't exists"}, status: :not_found
      end
    end
end