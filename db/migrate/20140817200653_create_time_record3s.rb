class CreateTimeRecord3s < ActiveRecord::Migration
  def change
    create_table :time_record3s do |t|
      t.datetime :time
      t.text :recordtype

      t.timestamps
    end
  end
end
