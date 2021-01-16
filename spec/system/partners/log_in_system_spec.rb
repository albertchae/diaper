RSpec.describe "Authentication", type: :system, js: true do

  describe 'logging in as a partner user' do
    let!(:partner_user) { FactoryBot.create(:partners_user, password: password) }
    let(:password) { Faker::Alphanumeric.alpha(number: 10) }

    context 'successfully through the partner user login page' do
      before do
        visit partner_user_session_path
      end

      it 'should take the user to the partners dashboard' do
        fill_in "user_email", with: partner_user.email
        fill_in "user_password", with: password
        find('input[name="commit"]').click

        expect(current_path).to eq(partners_dashboard_path)
      end
    end

    context 'when attempting to access diaperbase as a partner user' do
      before do
        visit new_user_session_path
      end

      it 'should not grant access' do
        visit "/users/sign_in"
        fill_in "user_email", with: "deactivated@example.com"
        fill_in "user_password", with: "password"
        find('input[name="commit"]').click

        expect(page).to have_content("Invalid Email or password")
      end
    end


  end

  describe "Success" do
    it "should show dashboard upon signin" do
      sign_in(@user)

      visit "/"
      expect(page.find("h1")).to have_content "Dashboard"
    end
  end

  describe "Deactivated user" do
    before do
      create(:user, :deactivated, email: "deactivated@exmaple.com")
    end

    it "should not allow the user to log in" do
      visit "/users/sign_in"
      fill_in "user_email", with: "deactivated@example.com"
      fill_in "user_password", with: "password"
      find('input[name="commit"]').click

      expect(page).to have_content("Invalid Email or password")
    end
  end
end

