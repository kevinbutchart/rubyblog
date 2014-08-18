class TimerecorderController < ApplicationController
	http_basic_authenticate_with name: "kevin", password: "secret", except: [:show]

	include DateTimeHelper 

	def signin
		tr = TimeRecord3.new
		currtime = Time.now.localtime
		t = currtime.in_time_zone
		t = time_to_nearest_quarter_hour(t)
		tr.time = currtime
		tr.recordtype = "in"
	
  		tr.save

		currdate = currtime.to_date
		dr = DayRecord4.find_by logdate: currdate
		if (!dr)
			dr = DayRecord4.new
			dr.logdate = currdate
			dr.inout = t.strftime('%H:%M')
			dr.hours = 1.0
		else
			dr.inout += "\n" + t.strftime('%H:%M')
			dr.hours = 1.0
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
		t = currtime.in_time_zone
		t = time_to_nearest_quarter_hour(t)
		tr.time = currtime
		tr.recordtype = "out"
	
  		tr.save

		currdate = currtime.to_date
		dr = DayRecord4.find_by logdate: currdate
		if (!dr)
			dr = DayRecord4.new
			dr.logdate = currdate
			dr.inout = '?? - ' + t.strftime('%H:%M')
			dr.hours = 1.0
		else
			dr.inout += ' - ' + t.strftime('%H:%M')
			dr.hours = 8.0
		end
		dr.save


		redirect_to timerecorder_index_path

	end

	def new
	end

	def create
	end

	def show
	end

	def index
		@dr = DayRecord4.all
  		@tr = TimeRecord3.all
	end

end
