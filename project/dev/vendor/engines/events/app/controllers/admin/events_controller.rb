module Admin
  class EventsController < Admin::BaseController

    crudify :event, :order => "startdate ASC",  :Sortable => false,
            :title_attribute => 'Title', :xhr_paging => true


  end
end






