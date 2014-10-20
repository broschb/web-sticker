class ScribbletsController < ApplicationController

  def index
    if current_user
      @page_id = 'scribblets'
      @scribblets = current_user.scribblets.order(updated_at: :desc).includes(:page => :site)
    else
      render :template => 'scribblets/welcome', :layout => false
    end
  end

  def destroy
    scribblet = Scribblet.delete(params[:id])
    render status: 200, json: scribblet.to_json
  end

end
