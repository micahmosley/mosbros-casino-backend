class CreateDealers < ActiveRecord::Migration[6.0]
  def change
    create_table :dealers do |t|
      t.string :name
      t.integer :game_id

      t.timestamps
    end
  end
end
