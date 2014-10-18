class ScribbletsController < ApplicationController

  def index
    if current_user
      @page_id = 'scribblets'
      @scribblets = current_user.scribblets.order(updated_at: :desc).includes(:page => :site)
    else
      render :template => 'scribblets/welcome', :layout => false
    end
  end

end
