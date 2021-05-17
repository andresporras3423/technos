class Word < ApplicationRecord
    belongs_to :techno
    belongs_to :user
    validates :word, presence: true, length: { minimum: 1 }
    validates :translation, presence: true, length: { minimum: 1 }
end
