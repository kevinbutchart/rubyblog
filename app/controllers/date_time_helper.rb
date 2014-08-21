module DateTimeHelper
  def time_to_next_quarter_hour(time)
    array = time.to_a
    quarter = ((array[1] % 60) / 15.0).ceil
    array[1] = (quarter * 15) % 60
    Time.local(*array) + (quarter == 4 ? 3600 : 0)
  end
  
  def time_to_nearest_quarter_hour(time)
    array = time.to_a
    quarter = ((array[1] % 60) / 15.0).round
	array[0] = 0
    array[1] = (quarter * 15) % 60
    Time.local(*array) + (quarter == 4 ? 3600 : 0)
  end
  
end
