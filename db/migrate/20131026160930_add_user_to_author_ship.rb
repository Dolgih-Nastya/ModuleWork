class AddUserToAuthorShip < ActiveRecord::Migration
  def change
    add_reference :author_ships, :user
  end
end
