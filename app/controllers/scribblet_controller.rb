class ScribbletController < ApplicationController

  def index
    @scribblets = current_user.scribblets.order(updated_at: :desc).includes(:page => :site)
  end

end
