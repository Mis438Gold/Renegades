require 'spec_helper'

describe Game do

  def reset_game(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @game.destroy! if @game
    @game = Game.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_game
  end

  context "validations" do
    
    it "rejects empty title" do
      Game.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_game
      Game.new(@valid_attributes).should_not be_valid
    end
    
  end

end