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

  def my_providers
    array_of_provider_ids = Enrollment.where({ :parent_id => self.id }).pluck(:provider_id)
    return Provider.where({ :id => array_of_provider_ids })
  end

  def my_latest_update 
    array_of_provider_ids = Enrollment.where({ :parent_id => self.id }).pluck(:provider_id)
    array_of_updates = Update.where({ :provider_id => array_of_provider_ids }).order( :date => :asc)
    return array_of_updates.at(0)
  end

  def user_updates
    array_of_provider_ids = Enrollment.where({ :parent_id => self.id }).pluck(:provider_id)
    array_of_updates = Update.where({ :provider_id => array_of_provider_ids }).order( :date => :asc)
    return array_of_updates
  end

  def user_provider_updates
    array_of_provider_ids = Provider.where({ :admin_id => self.id }).pluck(:id)
    array_of_updates = Update.where({ :provider_id => array_of_provider_ids}).order( :date => :asc)
    return array_of_updates
  end

  def user_provider_subscribers
    my_business = Provider.where({ :admin_id => self.id }).pluck(:id)
    array_of_parent_ids = Enrollment.where({ :provider_id => my_business }).pluck(:parent_id)
    return User.where({ :id => array_of_parent_ids })
  end

  def direct_messages
    return DirectMessage.where({ :receiver_id => self.id })
  end

  def calendar_items 
    providers = self.my_providers
    return Calendar.where({ :provider_id => providers})
  end
end
