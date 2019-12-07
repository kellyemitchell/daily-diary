class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.integer :provider_id
      t.string :reminders
      t.text :meals_and_snacks
      t.string :activities
      t.date :date

      t.timestamps
    end
  end
end
