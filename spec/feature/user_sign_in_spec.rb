require 'spec_helper'

feature "Logging in" do

  let!(:user) do
    sign_up
    Capybara.reset_session!
  end

  scenario "a user can sign in " do
    visit '/users/login'
    fill_in('email', :with => 'murtz@gmail.com')
    fill_in('password', :with => '1234')
    click_button 'Log in'
    expect(page).to have_content('Welcome, murtz@gmail.com')
  end

  scenario 'a user gets error message if login with invalid email' do
    visit '/users/login'
    fill_in('email', :with => 'murtz@gmail.com')
    fill_in('password', :with => 'hello')
    click_button 'Log in'
    expect(page).to have_content('Incorrect email or password')
  end
end
