feature 'Signing up' do
  scenario "when user signs up user count increases by one" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, murtz@gmail.com')
    expect(User.first.email).to eq('murtz@gmail.com')
  end

  scenario 'user sign up requires a matching password' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'browser stays on users/new page if mismatching password' do
    sign_up(password_confirmation: 'wrong')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content ('Password does not match the confirmation')
    end

    scenario 'a user can\'t sign up without entering an email' do
      expect{sign_up(email: nil)}.not_to change(User, :count)
    end

    scenario 'a user can\'t sign up with an incorrect email format' do
      expect{sign_up(email: 'murz.com')}.not_to change(User, :count)
    end

    scenario 'a user can\'t sign up with the same email address' do
      sign_up
      expect{sign_up}.not_to change(User, :count)
      expect(page).to have_content ('Email is already taken')
    end

end
