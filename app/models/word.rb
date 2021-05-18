class Word < ApplicationRecord
    belongs_to :techno
    belongs_to :user
    validates :word, presence: true, length: { minimum: 1 }
    validates :translation, presence: true, length: { minimum: 1 }
    validate :uniq_user_word_techno

    def uniq_user_word_techno
        if Word.where("user_id=#{self.user_id} and word='#{self.word}' and techno_id=#{self.techno_id} and id!= #{self.id.nil? ? -1 : self.id}").limit(1).length==1
            self.errors.add(:word, "the combination of user_id, word and techno_id must be unique")
        end 
    end
end
