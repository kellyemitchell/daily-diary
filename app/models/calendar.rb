# == Schema Information
#
# Table name: calendars
#
#  id          :integer          not null, primary key
#  date        :date
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  provider_id :integer
#

class Calendar < ApplicationRecord
  belongs_to :provider

end
