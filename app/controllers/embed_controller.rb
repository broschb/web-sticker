class EmbedController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]
  def index
    response.headers.delete('X-Frame-Options')
    render :layout => false
  end
end
