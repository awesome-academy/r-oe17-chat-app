class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions, dependent: :destroy
  has_many :groups, through: :subscriptions
  has_many :messages

  validates :name, length: {maximum: Settings.models.user.name_length},
            presence: true

  validates :mobile, length: {maximum: Settings.models.user.mobile_length}

  scope :room_by_user, ->(id){joins(:groups).where("users.id = ?", id)}
end
