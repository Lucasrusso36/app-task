class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :description, limit: 200
      t.boolean :completed

      t.timestamps
    end
  end
end
