class DashboardsController < ApplicationController

  def index
    @period = Period.new    
  end

end