require "rails_helper"

RSpec.describe Team, type: :model do
  describe "belongs to a Coach", points: 2 do
    it { should belong_to(:coach).class_name("Coach") }
  end
end

RSpec.describe Coach, type: :model do
  describe "has many career", points: 2 do
    it { should have_many(:career).class_name("Team") }
  end
end

RSpec.describe Player, type: :model do
  describe "has many seasons", points: 2 do
    it { should have_many(:seasons).class_name("Season") }
  end
end

RSpec.describe Player, type: :model do
  describe "has many career", points: 2 do
    it { should have_many(:career).through(:seasons).source(:team) }
  end
end

RSpec.describe Season, type: :model do
  describe "belongs to a Team", points: 2 do
    it { should belong_to(:team).class_name("Team") }
  end
end
