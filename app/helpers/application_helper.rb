module ApplicationHelper
  def menu_builder(page_id)
    icon_map = {"scribblets" => "fa fa-globe fa-lg", "sites" => "fa fa-globe fa-lg", "tags" => "fa fa-tags fa-lg"}
    ["scribblets", "sites", "tags"].map { |tab|
       %{<li class="#{page_id == tab ? "active" : "inactive"}"><a href="#{tab}"><i class="#{icon_map[tab]}">#{tab.capitalize}</i></a></li>}
    }.join("\n").html_safe
  end

end
