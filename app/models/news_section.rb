class NewsSection < ActiveRecord::Base
  belongs_to :news
  belongs_to :section
end
