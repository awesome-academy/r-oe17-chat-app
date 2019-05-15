class Message < ApplicationRecord
  belongs_to :user

  validates :body, length: {maximum: Settings.models.message.body_length},
            presence: true

  scope :custom_display, ->{order(:created_at).last(Settings.models.message.last_messages)}
end
