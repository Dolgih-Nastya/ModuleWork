class NewsWord < ActiveRecord::Base
  belongs_to :news
  belongs_to :word
end
