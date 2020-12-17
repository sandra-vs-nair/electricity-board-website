class WelcomeController < ApplicationController

  before_action :authorize_staff, only: []
  before_action :authorize_customer, only: []

  def index
  end

end
