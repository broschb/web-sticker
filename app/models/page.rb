class Page < ActiveRecord::Base
  has_many :scribblets
  belongs_to :site
end
