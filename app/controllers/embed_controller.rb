class EmbedController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]
  def index
    response.headers.delete('X-Frame-Options')
    render :layout => false
  end

  def create
    base_url = params['baseUrl']
    text = params['text']
    page_url = params['pageUrl']
    page_title = params['pageTitle']
    user = current_user

    site = Site.find_or_create_by(base_url: base_url)
    page = Page.find_or_create_by(site: site, page_url: page_url)
    page.page_name = page_title
    page.save!

    scribblet = Scribblet.new
    scribblet.user = user
    scribblet.page = page
    scribblet.selected_text = text
    scribblet.save!

    render status: 200, json: scribblet.to_json
  end

end
