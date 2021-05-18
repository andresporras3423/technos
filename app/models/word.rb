class Word < ApplicationRecord
    belongs_to :techno
    belongs_to :user
    validates :word, presence: true, length: { minimum: 1 }
    validates :translation, presence: true, length: { minimum: 1 }
    validate :uniq_user_word_techno

    def uniq_user_word_techno
        if Word.where(user_id: self.user_id, word: self.word, techno_id: self.techno_id).limit(1).length==1
            errors.add("unique_word_user_techno", "the combination of user_id, word and techno_id must be unique")
        end 
    end
end
