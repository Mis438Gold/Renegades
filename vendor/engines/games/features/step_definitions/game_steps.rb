Given /^I have no games$/ do
  Game.delete_all
end

Given /^I (only )?have games titled "?([^\"]*)"?$/ do |only, titles|
  Game.delete_all if only
  titles.split(', ').each do |title|
    Game.create(:title => title)
  end
end

Then /^I should have ([0-9]+) games?$/ do |count|
  Game.count.should == count.to_i
end
