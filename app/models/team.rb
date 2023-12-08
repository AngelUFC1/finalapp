# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  history     :text
#  titles      :integer
#  image       :string
#  name        :string
#  last_title  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  coach_id :integer
#

class Team < ApplicationRecord
  validates(:coach_id, presence: true)
  validates(:name, uniqueness: true)

  has_many(:seasons)

  belongs_to(:coach)

end
