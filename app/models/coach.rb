# == Schema Information
#
# Table name: coaches
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Coach < ApplicationRecord
  validates(:name, presence: true)
  has_many(:career, class_name: "Team")

end
