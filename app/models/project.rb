class Project < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    validates :user_id, presence: true
    has_many :rewards, dependent: :destroy

    validate :duration_cannot_be_in_the_past
    validates :goal,
      numericality: {only_integer: true, greater_than: 0}

    enum category: { Arts: 0, Comics_Illustrator: 1, Design_Tech: 2, Film: 3, Food_Craft: 4, Games: 5, Music: 6, Pablishing: 7}
    enum location: { Taiwan: 0, Japan: 1, Others: 2}


    private
      def duration_cannot_be_in_the_past
          errors.add(:duration, "can't be in the past") if duration < Date.today
      end
end
