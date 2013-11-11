class CreateAuthorShips < ActiveRecord::Migration
  def change
    create_table :author_ships do |t|

      t.timestamps
    end
  end
end
