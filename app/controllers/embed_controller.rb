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
    serialize_range = params['serializeRange']
    user = current_user

    site = Site.find_or_create_by(base_url: base_url)
    page = Page.find_or_create_by(site: site, page_url: page_url)
    page.page_name = page_title
    page.save!

    scribblet = Scribblet.new
    scribblet.user = user
    scribblet.page = page
    scribblet.selected_text = text
    scribblet.serialize_range = serialize_range
    scribblet.save!

    render status: 200, json: scribblet.to_json
  end

  def scripplets
    user = current_user
    base_url = params['baseUrl']
    page_url = params['pageUrl']
    #todo should be scope in model this is bad :(
    scribblets = current_user.scribblets.joins("INNER JOIN pages p on scribblets.page_id = p.id
                                   AND p.page_url = '#{page_url}'").
                                   joins("INNER JOIN sites s on s.id = p.site_id
                                   AND s.base_url = '#{base_url}'")
    render status: 200, json: scribblets.to_json
  end

end
