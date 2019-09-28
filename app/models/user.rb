class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy, foreign_key: 'user_id'

  validates :username, presence: true, length: { maximum: 30 }

  WEB_REGEXP = /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
  validates :website,
    format: { with: WEB_REGEXP, message: 'You provided invalid URL' },
    allow_blank: true

  #validates :instagram,
    #format: { with: /(https?)?:?(www)?instagram\.com/[a-z].{3}\z/ig,
      #message: 'url you provided is invalid.' },
    #allow_blank: true

  #validates :twitter,
    #format: { with:  https?:\/\/(.*\.)?twitter\.com\/[A-z0-9_]+\/?,
      #message: 'url you provided is invalid.' }
    #allow_blank: true

end