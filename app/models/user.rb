class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    validates :name, presence: {message: 'を入力してください'}

    has_many :memos, dependent: :destroy
    has_many :favorite_memos, through: :favorites, source: :memo
    has_many :favorites

    
    # has_many :memos,through: :favorites, dependent: :destroy


end
