class News < ActiveRecord::Base
    has_many :photos
    has_many :author_ships
    has_many :users, through: :author_ships
    has_many :news_words
    has_many :words, through: :news_words
    has_many :news_sections
    has_many :sections, through: :news_sections
end
