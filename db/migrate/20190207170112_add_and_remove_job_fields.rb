class AddAndRemoveJobFields < ActiveRecord::Migration[5.1]
  def up
    change_table :jobs do |t|
    t.remove :notes
    t.text :elevator_pitch
    t.text :why_get_excited
    t.text :description
    t.text :location
    end
  end

  def down
    change_table :jobs do |t|
      t.text :notes
      t.remove :elevator_pitch
      t.remove :why_get_excited
      t.remove :description
      t.remove :location
    end
  end
end
