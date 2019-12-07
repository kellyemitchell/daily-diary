class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.integer :provider_id
      t.integer :parent_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
