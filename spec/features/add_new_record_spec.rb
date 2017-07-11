require 'rails_helper'

describe "the add a new record process" do
  it "adds a new record" do
    user = FactoryGirl.create(:user, admin: true)
    record = FactoryGirl.create(:record)
    visit root_path
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_link 'Add Records'
    fill_in 'Title', :with => record.title
    fill_in 'Artist', :with => record.artist
    fill_in 'Price', :with => record.price
    fill_in 'Description', :with => record.description
    fill_in 'Genre', :with => record.genre
    fill_in 'Album length', :with => record.album_length
    click_button 'Create Record'
    expect(page).to have_content record.title
  end

  it "gives error when no information is entered" do
    user = FactoryGirl.create(:user, admin: true)
    visit root_path
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    visit new_record_path
    click_on 'Create Record'
    expect(page).to have_content 'errors'
  end
end
