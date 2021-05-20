class WordController < ApplicationController
    before_action :restrict_access, only: %i[create update search delete next_question]

    def create
        word = Word.new(techno_id: params[:techno_id], word: params[:word], translation: params[:translation], user_id: @user.id)
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
        render json: word.errors.messages, status: :conflict
      else
        render json: word.as_json, status: :accepted
      end
    end

    def search
      filter = params[:sort_by_word] ? 'word' : 'created_at'
      user_words=[]
      if params[:search]==1 # contains
        user_words=Word.joins(:technos).where("technos.techno_status is true
          and words.user_id=#{@user.id}
          and ('#{params[:word]}'='' or words.word LIKE '%#{params[:word]}%')
          and ('#{params[:translation]}'='' or words.translation LIKE '%#{params[:translation]}%')
          and (#{params[:techno_id]}=-1 or words.techno_id=#{params[:techno_id]})
          ").order(filter)
      elsif params[:search]==2 # starts
        user_words=Word.joins(:technos).where("technos.techno_status is true
            and words.user_id=#{@user.id}
            and ('#{params[:word]}'='' or words.word LIKE '#{params[:word]}%')
            and ('#{params[:translation]}'='' or words.translation LIKE '#{params[:translation]}%')
            and (#{params[:techno_id]}=-1 or words.techno_id=#{params[:techno_id]})
        ").order(filter)
      elsif params[:search]==3 # ends
        user_words=Word.joins(:technos).where("technos.techno_status is true
            and words.user_id=#{@user.id}
            and ('#{params[:word]}'='' or words.word LIKE '%#{params[:word]}')
            and ('#{params[:translation]}'='' or words.translation LIKE '%#{params[:translation]}')
            and (#{params[:techno_id]}=-1 or words.techno_id=#{params[:techno_id]})
        ").order(filter)
      elsif  params[:search]==4 # equals
        user_words=Word.joins(:technos).where("technos.techno_status is true
          and words.user_id=#{@user.id}
          and ('#{params[:word]}'='' or words.word = '#{params[:word]}')
          and ('#{params[:translation]}'='' or words.translation = '#{params[:translation]}')
          and (#{params[:techno_id]}=-1 or words.techno_id=#{params[:techno_id]})
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

    def next_question
        words = []
        words = Word.where("user_id=#{@user.id}
            and (#{params[:techno_id]}=-1 or techno_id=#{params[:techno_id]})").order("random()").limit(4)
        render json: words.as_json(only: %i[id word translation]), status: :accepted
    end
end