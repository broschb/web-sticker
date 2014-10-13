class EmbedController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]
  def index
    response.headers.delete('X-Frame-Options')
    render :layout => false
  end

  def create
    base_url = params['base_url']
    text = params['text']

    puts "#{base_url} -  #{text}"
    user = current_user
    site = Site.find_or_create_by(base_url: base_url)
    sticker = Sticker.new
    sticker.user = user
    sticker.site = site
    sticker.selected_text = text
    sticker.save!

    render status: 200, json: sticker.to_json
  end

end
