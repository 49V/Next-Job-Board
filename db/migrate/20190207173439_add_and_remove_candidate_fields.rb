class AddAndRemoveCandidateFields < ActiveRecord::Migration[5.1]
  def up
    change_table :candidates do |t|
      t.remove :bio
      t.remove :portfolio
      t.text :looking_for
      t.text :highlights
      t.string :LinkedIn
      t.string :GitHub
      t.string :Behance
      t.string :Dribbble
      t.string :Angellist
      t.text :other
      t.text :location
    end
  end

  def down
    change_table :candidates do |t|
      t.text :bio
      t.text :portfolio
      t.remove :looking_for
      t.remove :highlights
      t.remove :LinkedIn
      t.remove :GitHub
      t.remove :Behance
      t.remove :Dribbble
      t.remove :Angellist
      t.remove :other
      t.remove :location
    end
  end
end
