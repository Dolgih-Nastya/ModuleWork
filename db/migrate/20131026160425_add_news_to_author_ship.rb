class AddNewsToAuthorShip < ActiveRecord::Migration
  def change
    add_reference :author_ships, :news
  end
end
