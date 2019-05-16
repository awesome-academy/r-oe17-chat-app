class Group < ApplicationRecord
  LIMIT = 5

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  has_many :messages

  validates :name, length: {maximum: Settings.models.group.name_length},
            presence: true
  validates :is_active, presence: true

  scope :after, (lambda do |last_id|
    not_private
    .order(id: :desc)
    .where("id < ?", last_id)
    .limit(LIMIT)
  end)
  scope :latest, ->{not_private.order(id: :desc).limit(LIMIT)}
  scope :not_private, ->{where(private: false)}
  scope :subscriptions, (lambda do |user_id|
    joins(:subscriptions)
    .where(subscriptions: {user_id: user_id})
    .order(name: :asc)
  end)
end
