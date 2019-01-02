class AddNameToCandidate < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :name, :string
  end
end
