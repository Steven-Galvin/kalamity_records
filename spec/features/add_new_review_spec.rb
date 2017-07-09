require 'rails_helper'

describe "the add a new review process" do
  it "adds a new review" do
    user = FactoryGirl.create(:user, admin: true)
    record = FactoryGirl.create(:record)
    review = FactoryGirl.create(:review)
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
    click_on 'Create Record'
    click_link 'Add Review'
    fill_in 'Content', :with => review.content
    find('#review_rating').find(:xpath, 'option[2]').select_option
    click_on 'Create Review'
    expect(page).to have_content review.content
  end

  it "gives error when no information is entered" do
    user = FactoryGirl.create(:user, admin: true)
    record = FactoryGirl.create(:record)
    visit root_path
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    visit new_record_review_path(record)
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end
