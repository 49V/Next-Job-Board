class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.text :bio
      t.string :portfolio
      t.string :role
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :candidates, [:user_d, :created_at]
  end
end
