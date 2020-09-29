class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
        extend ActiveHash::Associations::ActiveRecordExtensions
        belongs_to_active_hash :prefecture
      
        VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
        VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
        VALID_KANANAME_REGEX = /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/
        VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
      
        validates :display_name, presence: true
        validates :company_name, presence: true
        validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
        validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'must include both letters and numbers'  }
        validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: 'must include both letters and numbers'  }
        validates :family_name_in_charge, presence: true, format: { with: VALID_NAME_REGEX, message: 'must be Full-width characters' }
        validates :first_name_in_charge, presence: true, format: { with: VALID_NAME_REGEX, message: 'must be Full-width characters' }
        validates :kana_family_name_in_charge, presence: true, format: { with: VALID_KANANAME_REGEX, message: 'must be Full-width katakana characters' }
        validates :kana_first_name_in_charge, presence: true, format: { with: VALID_KANANAME_REGEX, message: 'must be Full-width katakana characters' }
        validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: "invalid: Input Half-width numbers with hyphen"}
        validates :prefecture_id, numericality: { other_than: 0, message: 'must be Selected' }
        validates :city, presence: true
        validates :street_address, presence: true
        validates :phone_number, presence: true, length: { maximum: 11 } 
        validates :mobile_number, length: { maximum: 11 } 
        
        has_many :styles
end
