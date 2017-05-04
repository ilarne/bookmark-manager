
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
    Link.create(url: 'http://www.google.com', title: 'Google', tag: 'search')
    visit '/links'

    within 'ul#links' do
      expect(page).to have_content('search')
    end
  end
end
