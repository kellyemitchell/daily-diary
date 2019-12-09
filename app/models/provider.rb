# == Schema Information
#
# Table name: providers
#
#  id          :integer          not null, primary key
#  admin_name  :string
#  description :text
#  location    :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  admin_id    :integer
#

class Provider < ApplicationRecord

  belongs_to :admin, :class_name => "User"
  has_many :enrollments, :dependent => :destroy
  has_many :updates, :dependent => :nullify
  has_many :calendars, :dependent => :destroy
  has_many :direct_messages, :foreign_key => "sender_id", :dependent => :destroy

  def subscribers 
    array_of_parent_ids = Enrollment.where({ :provider_id => self.id }).pluck(:parent_id)
    return User.where({ :id => array_of_parent_ids })
  end

  
end
