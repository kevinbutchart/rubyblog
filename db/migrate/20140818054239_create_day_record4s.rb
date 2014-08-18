class CreateDayRecord4s < ActiveRecord::Migration
  def change
    create_table :day_record4s do |t|
      t.date :logdate
      t.text :inout
      t.decimal :hours

      t.timestamps
    end
  end
end
