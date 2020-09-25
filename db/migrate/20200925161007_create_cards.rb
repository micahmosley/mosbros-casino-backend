class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :suite
      t.string :value
      t.string :color
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
