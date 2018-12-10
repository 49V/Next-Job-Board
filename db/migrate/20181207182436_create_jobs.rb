class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.text :title
      t.text :company
      t.string :website
      t.string :link
      t.string :role
      t.text :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :jobs, [:user_id, :created_at]
  end
end
