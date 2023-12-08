# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  player_id   :integer
#  team_id   :integer
#
class Season < ApplicationRecord
  
  belongs_to(:team)
  has_many(:player)
 
end
 