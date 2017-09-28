require 'rails_helper'

#index page should show all the journeys that have previously been created
#Visiting the `/journeys/3 path should details for a journey with the ID of 3.

feature "User sees list of prior trips" do
  before(:each) do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: "test@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'




    scenario "sees a list of journeys and link to comment on it" do
      boroughs = Journey.create(origin: 'Brooklyn', destination: 'Queens', hours: '1', minutes: '33')

      visit journeys_path

      expect(page).to have_content "Brooklyn"
      expect(page).to have_content "Queens"
      expect(page).to have_content "Your Travel time: 1: 33"
      expect(page).to have_content "You're"

      click_link "Add a comment"

      expect(page).to have_content "Add a comment!"
      expect(page).to have_content "Name"
      expect(page).to have_content "Body"
    end
  end
end
