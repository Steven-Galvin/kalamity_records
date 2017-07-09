require 'rails_helper'

describe "the edit a review process" do
  it "edits a review" do
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
    click_link 'Edit Review'
    fill_in 'Content', :with => "Gotta make sure my tests pass"
    click_on 'Update Review'
    expect(page).to have_content "Gotta make sure my tests pass"
  end

  it "gives error when no information is entered" do
    user = FactoryGirl.create(:user, admin: true)
    record = FactoryGirl.create(:record)
    review = FactoryGirl.create(:review)
    visit root_path
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    visit edit_record_review_path(record, review)
    fill_in 'Content', :with => ''
    click_on 'Update Review'
    expect(page).to have_content 'errors'
  end
end
