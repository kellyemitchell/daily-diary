class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :update_id
      t.string :image_url
      t.string :caption

      t.timestamps
    end
  end
end
