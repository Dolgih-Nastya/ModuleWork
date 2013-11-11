class AddWordToNewsWord < ActiveRecord::Migration
  def change
    add_reference :news_words, :word
  end
end
