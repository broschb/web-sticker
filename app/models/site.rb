class Site < ActiveRecord::Base
  has_many :pages
   scope :for_user, ->(user) { joins("INNER JOIN pages p on p.site_id = sites.id").
                               joins("INNER JOIN scribblets s on s.page_id = p.id and s.user_id = #{user.id}").
                               distinct}
end
