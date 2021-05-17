class Techno < ApplicationRecord
    has_many :words, dependent: :destroy
    belongs_to :user
    validates :techno_name, presence: true, length: { minimum: 1 }
end
