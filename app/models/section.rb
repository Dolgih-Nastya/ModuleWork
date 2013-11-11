class Section < ActiveRecord::Base
  has_many :news_sections
  has_many :newses, through: :news_sections
  has_many :subscriptions
  has_many :users, through: :subscriptions
end
