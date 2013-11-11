class AddPhotoToNews < ActiveRecord::Migration
  def change
    add_reference :news, :photo
  end
end
