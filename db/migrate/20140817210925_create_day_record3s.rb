class CreateDayRecord3s < ActiveRecord::Migration
  def change
    create_table :day_record3s do |t|
      t.date :logdate
      t.time :amintime
      t.time :amouttime
      t.time :pmintime
      t.time :pmouttime

      t.timestamps
    end
  end
end
