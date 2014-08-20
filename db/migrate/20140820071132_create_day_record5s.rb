class CreateDayRecord5s < ActiveRecord::Migration
  def change
    create_table :day_record5s do |t|
      t.date :logdate
      t.time :in1
      t.time :out1
      t.time :in2
      t.time :out2
      t.decimal :hours
      t.text :summary

      t.timestamps
    end
  end
end
