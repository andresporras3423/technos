class User < ApplicationRecord
    has_secure_password
    validates :password, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true
    has_many :technos, dependent: :destroy
    has_many :words, dependent: :destroy
    has_many :tests, dependent: :destroy
end
