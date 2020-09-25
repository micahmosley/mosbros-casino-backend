class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.integer :bank
      t.integer :game_id

      t.timestamps
    end
  end
end
