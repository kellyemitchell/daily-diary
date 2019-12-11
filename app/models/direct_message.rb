# == Schema Information
#
# Table name: direct_messages
#
#  id          :integer          not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  receiver_id :integer
#  sender_id   :integer
#

class DirectMessage < ApplicationRecord
  belongs_to :receiver, :class_name => "User"
  belongs_to :sender, :class_name => "Provider"

  def sender
    user = DirectMessage({ :id => self.id }).pluck(sender_id).at(0)
    return User.where({ :id => user }).at(0)
  end
end
