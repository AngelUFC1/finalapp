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
#
class Player < ApplicationRecord
  validates(:name, presence: true)
  has_many(:seasons)

  has_many(:career, through: :seasons, source: :team)

end
