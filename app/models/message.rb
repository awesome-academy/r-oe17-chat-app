class Message < ApplicationRecord
  LIMIT = 5

  belongs_to :user
  belongs_to :group

  validates :body, length: {maximum: Settings.models.message.body_length},
            presence: true

  after_create_commit{MessageBroadcastJob.perform_later self}

  scope :in_group, ->(group_id){where(group: group_id)}
  scope :latest, ->{order(:created_at).last(5)}
  scope :older_than, (lambda do |timestamp|
    where("created_at < (?)", timestamp)
    .order(:created_at)
    .last(LIMIT)
  end)
end
