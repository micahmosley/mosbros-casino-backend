class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :suit
      t.string :value
      t.string :color
      t.integer :rank
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
