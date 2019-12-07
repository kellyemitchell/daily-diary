# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  caption    :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  update_id  :integer
#

class Photo < ApplicationRecord

  belongs_to :provider_update, :class_name => "Update", :foreign_key => "update_id"
end
