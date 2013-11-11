class CreateNewsSections < ActiveRecord::Migration
  def change
    create_table :news_sections do |t|

      t.timestamps
    end
  end
end
