class Techno < ApplicationRecord
    has_many :words, dependent: :destroy
    belongs_to :user
    validates :techno_name, presence: true, length: { minimum: 1 }
    validate :uniq_user_techno

    def uniq_user_techno
        if Techno.where("user_id=#{self.user_id} and techno_name=#{self.techno_name} and id!= #{self.id.nil? ? -1 : self.id}").limit(1).length==1
            self.errors.add(:techno_name, "the combination of user_id and techno_name must be unique")
        end 
    end
end
