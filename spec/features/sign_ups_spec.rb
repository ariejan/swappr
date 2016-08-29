require 'rails_helper'

RSpec.feature "sign up", type: :feature do

  context 'devise sign up' do
    let(:email) { "john.doe@example.com" }

    before do
      visit '/users/sign_up'
      fill_in "user_email", with: email
      fill_in "user_password", with: "tester123"
      fill_in "user_password_confirmation", with: "tester123"
      click_button 'Sign up'
    end

    it "redirects to the after signup wizard" do
      expect(current_path).to eq('/after_signup/profile')
    end

    it "sends a confirmation email" do
      expect(unread_emails_for(email).size).to eq(1)
      open_email(email)
      expect(current_email).to have_subject("Confirmation instructions")
    end

    xit "allows confirmation through email" do
    end
  end

  context 'step 1 - fill out profile' do
    let(:user) { create :user }

    before { sign_in(user) }

    it 'handles valid input' do
      visit '/after_signup/profile'
      fill_in 'user_full_name', with: 'John X. Doe'
      fill_in 'user_mobile_number', with: '06-11223344'
      check 'user_whatsapp'
      click_button 'Next'

      expect(current_path).to eq('/after_signup/address')

    end
  end
end
