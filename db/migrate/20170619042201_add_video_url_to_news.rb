class AddVideoUrlToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :video_url, :string
  end
end
