class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :profile, :address, :bank_account

  before_filter :authenticate_user!

  def show
    @user = current_user

    case step
    when :address then
      @address = Address.new
    when :bank_account then
      @bank_account = BankAccount.new
    end

    render_wizard
  end

  def update
    @user = current_user

    case step
    when :profile then
      @user.update_attributes(user_params)
    when :address then
      @address = @user.addresses.create(address_params)
    when :bank_account then
      @bank_account = @user.bank_accounts.create(bank_account_params)
    end

    render_wizard @user
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :mobile_number, :whatsapp)
  end

  def address_params
    params.require(:address).permit(:name, :address, :postcode, :city, :country)
  end

  def bank_account_params
    params.require(:bank_account).permit(:name, :bank_name, :iban, :bic)
  end

  def finish_wizard_path
    deals_path
  end
end
