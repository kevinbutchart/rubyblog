class TimerecorderController < ApplicationController
	http_basic_authenticate_with name: "kevin", password: "secret", except: [:show]

	include DateTimeHelper 

	def signin
		tr = TimeRecord3.new
		currtime = Time.now.localtime
		t = currtime.in_time_zone
		# t = time_to_next_quarter_hour(t)
		tr.time = currtime
		tr.recordtype = "in"
	
  		tr.save

		currdate = currtime.to_date
		dr = DayRecord3.find_by logdate: currdate
		if (dr) 
			dr.pmintime = t.in_time_zone
		else
			dr = DayRecord3.new
			dr.logdate = currdate
			dr.amintime = t.in_time_zone
			dr.amouttime = Time.local(Time.now.year, Time.now.month, Time.now.day, 12,0) 
			dr.pmintime = Time.local(Time.now.year, Time.now.month, Time.now.day, 13,0) 
			dr.pmouttime = t.in_time_zone
		end
		dr.save

		#@dr = DayRecord3.all
  		#@tr = TimeRecord3.all
		#render 'index'
		redirect_to timerecorder_index_path
	end

	def signout
		tr = TimeRecord3.new
		currtime = Time.now.localtime
		t = currtime.to_time
		t = time_to_next_quarter_hour(t)
		tr.time = currtime
		tr.recordtype = "out"
	
  		tr.save

		currdate = currtime.to_date
		dr = DayRecord3.find_by logdate: currdate
		if (dr) 
			dr.pmouttime = t
		else
			dr = DayRecord3.new
			dr.logdate = currdate
			dr.amintime = t
			dr.amouttime = t
			dr.pmintime = t
			dr.pmouttime = t
		end
		dr.save

		#@dr = DayRecord3.all
  		#@tr = TimeRecord3.all
		#render 'index'
		redirect_to timerecorder_index_path

	end

	def new
	end

	def create
	end

	def show
	end

	def index
		@dr = DayRecord3.all
  		@tr = TimeRecord3.all
	end

end
