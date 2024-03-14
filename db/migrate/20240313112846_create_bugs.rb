class CreateBugs < ActiveRecord::Migration[7.0]
  def change
    create_table :bugs do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true
      t.integer :developer_id
      t.string :description
      t.date :dead_line
      t.integer :type
      t.integer :status
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
