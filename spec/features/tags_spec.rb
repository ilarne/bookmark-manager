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

feature 'Filters by tag' do
  before(:each) do
  Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(category: 'education')])
  Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(category: 'search')])
  Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(category: 'bubbles')])
  Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(category: 'bubbles')])
end

scenario 'I can filter links by tag' do
  visit '/tags/bubbles'

  expect(page.status_code).to eq(200)

    within 'ul#links' do
      expect(page).to have_content('Bubble Bobble')
      expect(page).to have_content('This is Zombocom')
      expect(page).not_to have_content('Google')
    end
  end
end

feature 'Assigning multiple tags' do
  scenario 'can add multiple tags to a link' do
    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com/'
    fill_in 'tag', :with => 'our tormentors, school, why, bane of my existance'
    click_button 'Submit'
    visit '/tags/school'
    expect(page).to have_content('Makers Academy')
    visit '/tags/why'
    expect(page).to have_content('Makers Academy')
  end
end
