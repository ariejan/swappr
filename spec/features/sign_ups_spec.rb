require 'rails_helper'

RSpec.feature "sign up", type: :feature do

  context 'devise sign up' do
    before do
      visit '/users/sign_up'
      fill_in "user_email", with: "john.doe@example.com"
      fill_in "user_password", with: "tester123"
      fill_in "user_password_confirmation", with: "tester123"
      click_button 'Sign up'
    end

    it "redirects to the after signup wizard" do
      expect(current_path).to eq('/after_signup/profile')
    end

    it "sends a confirmation email" do
      expect(unread_emails_for('john.doe@example.com').size).to eq(1)
    end
  end
end
