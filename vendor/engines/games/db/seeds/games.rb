User.find(:all).each do |user|
  if user.plugins.find_by_name('games').nil?
    user.plugins.create(:name => 'games',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Games',
  :link_url => '/games',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/games(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
