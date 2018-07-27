class CreateConvertionHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :convertion_histories do |t|
      t.string :from
      t.string :to
      t.float :rate
      t.float :amount

      t.timestamps
    end
  end
end
