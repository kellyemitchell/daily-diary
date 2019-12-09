# == Schema Information
#
# Table name: updates
#
#  id               :integer          not null, primary key
#  activities       :string
#  date             :date
#  meals_and_snacks :text
#  reminders        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  provider_id      :integer
#

class Update < ApplicationRecord

  belongs_to :provider
  has_many :photos, :dependent => :destroy

  has_one :author, :through => :provider, :source => :admin

  def author
    return provider_name = Provider.where({ :id => self.provider_id}).pluck(:name).at(0)
  end
  
end
