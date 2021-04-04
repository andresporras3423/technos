class Techno < ApplicationRecord
    has_many :words, dependent: :destroy
    belongs_to :user
end
