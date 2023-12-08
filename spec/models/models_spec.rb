require "rails_helper"

describe "Team" do
  it "has a class defined in app/models/", points: 1 do
    expect{ Team }.to_not raise_error(NameError),
      "Expected a Movie class to be defined in the app/models/ folder, but didn't find one."
  end
end

describe "Coach" do
  it "has a class defined in app/models/", points: 1 do
    expect{ Coach }.to_not raise_error(NameError),
      "Expected a Coach class to be defined in the app/models/ folder, but didn't find one."
  end
end

describe "Player" do
  it "has a class defined in app/models/", points: 1 do
    expect{ Player }.to_not raise_error(NameError),
      "Expected a Actor class to be defined in the app/models/ folder, but didn't find one."
  end
end

describe "Season" do
  it "has a class defined in app/models/", points: 1 do
    expect{ Season }.to_not raise_error(NameError),
      "Expected a Character class to be defined in the app/models/ folder, but didn't find one."
  end
end
