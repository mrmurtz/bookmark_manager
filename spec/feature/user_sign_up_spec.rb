feature 'Signing up' do
  scenario "when user signs up user count increases by one" do
    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content('Welcome, summerisawesome@gmail.com')
    expect(User.first.email).to eq('summerisawesome@gmail.com')
  end

  scenario 'user sign up requires a matching password' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'browser stays on users/new page if mismatching password' do
    sign_up(password_confirmation: 'wrong')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content ('How hard is it to re-enter the same password, srsly!')
    end
end
