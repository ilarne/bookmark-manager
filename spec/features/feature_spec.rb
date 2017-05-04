
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
