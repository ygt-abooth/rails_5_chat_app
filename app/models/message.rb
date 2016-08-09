class Message < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :chat_room, optional: true
  validates :body, presence: true, length: {minimum: 2, maximum: 1000}
  after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
