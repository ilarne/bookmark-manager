
feature 'Show bookmarks on homepage' do
  scenario 'displays a list of links' do
    Link.create(:name => 'Google', :URL => 'http://www.google.com')
    visit '/'
    find_link('Google').visible?
  end
end
