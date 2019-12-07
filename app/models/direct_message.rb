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

end
