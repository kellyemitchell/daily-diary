class CreateCalendars < ActiveRecord::Migration[6.0]
  def change
    create_table :calendars do |t|
      t.integer :provider_id
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
