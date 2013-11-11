class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :header
      t.text :news
      t.datetime :date_time
      t.integer :views_number
      t.timestamps
    end
  end
end
