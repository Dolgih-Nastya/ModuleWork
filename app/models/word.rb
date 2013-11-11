class Word < ActiveRecord::Base
  has_many :news_words
  has_many :newses, through: :news_words
end
