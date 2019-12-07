# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  child_name      :string
#  email           :string
#  name            :string
#  password_digest :string
#  provider        :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many :enrollments, :foreign_key => "parent_id", :dependent => :destroy
  has_many :providers, :foreign_key => "admin_id", :dependent => :destroy
  has_many :direct_messages, :foreign_key => "receiver_id", :dependent => :destroy

  has_many :updates, :through => :providers, :source => :updates

end
