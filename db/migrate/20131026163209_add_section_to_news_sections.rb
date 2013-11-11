class AddSectionToNewsSections < ActiveRecord::Migration
  def change
    add_reference :news_sections, :news
  end
end
