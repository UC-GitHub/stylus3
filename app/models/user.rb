class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
        VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
        VALID_KANANAME_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
      
        validates :nickname, presence: true
        # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
        validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'must include both letters and numbers'  }
        validates :first_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'must be Full-width characters' }
        validates :family_name, presence: true, format: { with: VALID_NAME_REGEX, message: 'must be Full-width characters' }
        validates :kana_first_name, presence: true, format: { with: VALID_KANANAME_REGEX, message: 'must be Full-width katakana characters' }
        validates :kana_family_name, presence: true, format: { with: VALID_KANANAME_REGEX, message: 'must be Full-width katakana characters' }
        validates :birthday, presence: true
        validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: "invalid: Input Half-width numbers with hyphen"}
        validates :prefecture_id, numericality: { other_than: 0, message: 'must be Selected' }
        validates :city, presence: true
        validates :street_address, presence: true
        validates :phone_number, presence: true, length: { maximum: 11 } 
        validates :shoe_size, presence: true
        
        has_many :orders
end
