class EventsController < ApplicationController

  before_filter :find_all_events
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

  def show
    @event = Event.find(params[:id])

    # 6 needs to be replaced by whatever club member recording thingie we come up with

      if params[:attending] == "1"
        @event.club_members.push(ClubMember.find(6))
        @event.save
      end
      else if params[:attending] == "0"
        @event.club_members.delete(ClubMember.find(6))
        @event.save
      end  

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @event in the line below:
    present(@page)
  end

  
protected

  def find_all_events
    # Order by event date
    @events = Event.find(:all, :order => "startdate ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/events")
  end

end