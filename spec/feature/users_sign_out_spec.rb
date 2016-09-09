require 'spec_helper'

feature "Logging out" do

  let!(:user) do
    sign_up
    Capybara.reset_session!
  end

  scenario 'a logged in user can log out and is given a bye message' do
    login
    click_button 'Log out'
    expect(page).to have_content ('See you again soon')
  end
end
