class CreateNewsWords < ActiveRecord::Migration
  def change
    create_table :news_words do |t|

      t.timestamps
    end
  end
end
