class SiteController < ApplicationController

  def index
    @sites = Site.for_user(current_user)
  end

end
