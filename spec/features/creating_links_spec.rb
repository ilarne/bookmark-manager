feature 'Creating links' do
  scenario 'uses a form to submit a link' do
    visit '/links/new'
    fill_in 'title', :with => 'Makers Academy'
    fill_in 'url', :with => 'http://www.makersacademy.com/'
    click_button 'Submit'
    expect(current_path).to eq '/links'
    within 'ul#links' do
    expect(page).to have_content('Makers Academy')
  end
end
end
