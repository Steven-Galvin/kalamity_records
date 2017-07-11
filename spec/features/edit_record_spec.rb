require 'rails_helper'

describe "the edit a record process" do
  it "edits a record" do
    user = FactoryGirl.create(:user, admin: true)
    record = FactoryGirl.create(:record)
    visit root_path
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    click_link 'All Records'
    click_on record.title
    click_link 'Edit Record'
    fill_in 'Title', :with => 'New Title'
    click_on 'Update Record'
    expect(page).to have_content 'New Title'
  end

  it "gives error when no information is entered" do
    user = FactoryGirl.create(:user, admin: true)
    record = FactoryGirl.create(:record)
    visit root_path
    click_link 'Login'
    fill_in 'Email', :with => user.email
    fill_in 'Password', :with => user.password
    click_on 'Log in'
    visit edit_record_path(record)
    fill_in 'Title', :with => ''
    click_on 'Update Record'
    expect(page).to have_content 'errors'
  end
end
