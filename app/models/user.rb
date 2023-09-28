class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' },
                        allow_blank: true
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters.' },
                         allow_blank: true
  validates :last_name_yomi, presence: true
  validates :last_name_yomi, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' },
                             allow_blank: true
  validates :first_name_yomi, presence: true
  validates :first_name_yomi, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters.' },
                              allow_blank: true
  validates :birthday, presence: true
end
