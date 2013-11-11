class AddNewsWordToNewsWord < ActiveRecord::Migration
  def change
    add_reference :news_words, :news
  end
end
