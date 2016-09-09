require './app/models/user'

describe User do
  let(:user) {User.create(email: 'murtz@gmail.com', password: '1234', password_confirmation: '1234')}


  describe "user_exists" do
    it "returns the details of a user" do
      logged_in_user = User.user_exists(user.email, user.password)
      expect(logged_in_user).to eq user
    end

    it "returns nil if password does not match db password" do
      logged_in_user = User.user_exists(user.email, 'hello')
      expect(logged_in_user).to eq nil
    end
  end
end
