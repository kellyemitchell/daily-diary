# == Schema Information
#
# Table name: enrollments
#
#  id          :integer          not null, primary key
#  accepted    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  parent_id   :integer
#  provider_id :integer
#

class Enrollment < ApplicationRecord
  belongs_to :parent, :class_name => "User"
  belongs_to :provider
end
