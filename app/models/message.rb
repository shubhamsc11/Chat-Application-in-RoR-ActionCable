class Message < ApplicationRecord
  self.table_name = "messages"
  belongs_to :user #, foreign_key: true
  belongs_to :room #, foreign_key: true

  after_create_commit { broadcast_append_to self.room }
  before_create :confirm_participant

  def confirm_participant
    if self.room.is_private
      is_participant = Participant.where(user_id: self.user.id, room_id: self.room.id).first
      throw :abort unless is_participant
    end
  end
end
