class AddPhotoName < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :photo_name, :string
  end
end
