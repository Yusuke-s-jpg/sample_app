class AddTextInsteadString < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :content, :string
    add_column :posts, :content, :text
  end
end
