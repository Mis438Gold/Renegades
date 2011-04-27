class GamesController < ApplicationController

  before_filter :find_all_games
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @game in the line below:
    present(@page)
  end

  def show
    @game = Game.find(params[:id])

        #true needs to be replaced with whatever logic we want to have here to see if people are logged in
    @isLoggedIn = true

    if @isLoggedIn
      if params[:owning] == "1"
        @game.club_members.push(ClubMember.find(6))
        @game.save
      end
      if params[:owning] == "0"
        @game.club_members.delete(ClubMember.find(6))
        @game.save
      end
      #this is where I do the crap to post a comment

      if not params[:comment].nil?
        @aComment = Comment.new do |c|
          c.club_member_id = 6
          c.game_id = @game.id
          c.comment = params[:comment]
          c.approved = false
        end
        @game.comments.push(@aComment)
      end
      @game.save
    end
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @game in the line below:
    present(@page)
  end

protected

  def find_all_games
    @games = Game.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/games")
  end

end
