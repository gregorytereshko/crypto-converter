class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :from
      t.string :to
      t.float :rate

      t.timestamps
    end

    add_index :rates, [:from, :to], unique: true
  end
end
