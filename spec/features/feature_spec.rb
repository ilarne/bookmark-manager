
feature 'Show bookmarks on homepage' do
  scenario 'displays a list of links' do
    Link.create(url: 'http://www.google.com', title: 'Google')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end
end

feature 'Tagging links' do
  scenario 'adds tags to links' do
    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com/'
    fill_in 'tag', :with => 'our tormentors'
    click_button 'Submit'
    link = Link.first
    expect(link.tags.map(&:category)).to include('our tormentors')
    end
  end
