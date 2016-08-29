class DealsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deals = current_user.deals
  end
end
