class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, length: {maximum: Settings.models.message.body_length}
end
