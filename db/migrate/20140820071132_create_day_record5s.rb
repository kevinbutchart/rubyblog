class CreateDayRecord5s < ActiveRecord::Migration
  def change
    create_table :day_record5s do |t|
      t.date :logdate
      t.datetime :in1
      t.datetime :out1
      t.datetime :in2
      t.datetime :out2
      t.decimal :hours
      t.text :summary

      t.timestamps
    end
  end
end
