class SiteController < ApplicationController

  def index
    @page_id = 'sites'
    @sites = Site.for_user(current_user)
  end

end
