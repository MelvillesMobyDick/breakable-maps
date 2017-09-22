require 'rails_helper'

#A journey must have an origin, a destination, and a travel time
#Visiting the `/journeys/new` path should display a form for creating a new journey.
#When adding a new journey, if I fill out the form correctly, I should see a page that tells me whether I am smarter than google maps and allows me to make comments.
#When adding a new journey, if I fill out the form incorrectly and submit the form, I should see the form and be displayed the validation errors.

feature "User adds journey" do
  before(:each) do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: "test@gmail.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
  end

  scenario "User adds journey successfully" do
    visit new_journey_path
    expect(page).to have_content "Record Your Journey!"

    fill_in 'Origin', with: "Boston"
    fill_in 'Destination', with: "Philadelphia"
    fill_in 'Travel time', with: "2 hours"

    click_button "Submit"

    expect(page).to have_content "You're smarter than Google Maps"
    expect(page).to have_content "Record Another Journey"
    expect(page).to have_content "See All Journeys"
  end

  scenario "User adds journey successfully" do
    visit new_journey_path

    click_button "Submit"
    expect(page).to have_content "Origin can't be blank"
    expect(page).to have_content "Destination can't be blank"
    expect(page).to have_content "Travel time can't be blank"
  end
end
