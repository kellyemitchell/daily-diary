class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.integer :admin_id
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
