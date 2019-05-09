class Group < ApplicationRecord
  has_and_belongs_to_many :users

  validates :name, length: {maximum: Settings.models.group.name_length},
            presence: true
  validates :is_active, presence: true
end
