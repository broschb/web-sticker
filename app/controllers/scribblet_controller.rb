class ScribbletController < ApplicationController

  def index
    @page_id = 'scribblets'
    @scribblets = current_user.scribblets.order(updated_at: :desc).includes(:page => :site)
  end

end
