# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  has_many(:career, through: :seasons, source: :team)

class Player < ApplicationRecord
  validates(:name, presence: true)
  
  has_many(:career, class_name: "Team")

end
