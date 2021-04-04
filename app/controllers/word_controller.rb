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
      filter = params[:sort_by_word] ? 'word' : 'created_at'
      user_words=[]
      if params[:search]==1
        user_words=Word.where("user_id=#{cookies[:id]}
          and ('#{params[:word]}'='' or word LIKE '%#{params[:word]}%')
          and ('#{params[:translation]}'='' or translation LIKE '%#{params[:translation]}%')
          and (#{params[:techno_id]}=-1 or techno_id=#{params[:techno_id]})
          ").order(filter)
      elsif params[:search]==2
        user_words=Word.where("user_id=#{cookies[:id]}
            and ('#{params[:word]}'='' or word LIKE '#{params[:word]}%')
            and ('#{params[:translation]}'='' or translation LIKE '#{params[:translation]}%')
            and (#{params[:techno_id]}=-1 or techno_id=#{params[:techno_id]})
        ").order(filter)
      elsif params[:search]==3
        user_words=Word.where("user_id=#{cookies[:id]}
            and ('#{params[:word]}'='' or word LIKE '%#{params[:word]}')
            and ('#{params[:translation]}'='' or translation LIKE '%#{params[:translation]}')
            and (#{params[:techno_id]}=-1 or techno_id=#{params[:techno_id]})
        ").order(filter)
      elsif  params[:search]==4
        user_words=Word.where("user_id=#{cookies[:id]}
            and ('#{params[:word]}'='' or word = '#{params[:word]}')
          and ('#{params[:translation]}'='' or translation = '#{params[:translation]}')
          and (#{params[:techno_id]}=-1 or techno_id=#{params[:techno_id]})
            ").order(filter)
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

    def next_word
        words = []
        words = Word.where("user_id=#{cookies[:id]}
            and (#{params[:techno_id]}=-1 or techno_id=#{params[:techno_id]})").order("random()").limit(4)
        render json: words.as_json(only: %i[id word translation]), status: :accepted
    end
end