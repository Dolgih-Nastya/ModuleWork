class AddNewsToNewsSection < ActiveRecord::Migration
  def change
    add_reference :news_sections, :section
  end
end
