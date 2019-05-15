class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :groups
  has_many :messages

  validates :name, length: {maximum: Settings.models.user.name_length},
            presence: true

  validates :mobile, length: {maximum: Settings.models.user.mobile_length}
end
