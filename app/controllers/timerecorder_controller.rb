class TimerecorderController < ApplicationController
	http_basic_authenticate_with name: "kevin", password: "secret", except: [:show]

	include DateTimeHelper 

	def formatTime(rec)
		summary = "none"
		in1timetext = rec.in1 ? rec.in1.in_time_zone.strftime('%H:%M') : ""
		out1timetext = rec.out1 ? rec.out1.in_time_zone.strftime('%H:%M') : ""
		in2timetext = rec.in2 ? rec.in2.in_time_zone.strftime('%H:%M') : ""
		out2timetext = rec.out2 ? rec.out2.in_time_zone.strftime('%H:%M') : ""

		if (rec.in1==nil) 
			summary = '' 
		else 
			if (rec.out1 == nil) 
				summary = rec.in1.strftime('%H:%M')	+ " - " 
			else
				if (rec.in2 == nil) 
					hours = (rec.out1.to_f - rec.in1.to_f)/3600
					if (hours > 4) 
						summary =  in1timetext	+ " - 12:00\n13:00 - " +  out1timetext	
					else
						summary =  in1timetext	+ " - 12:00\n13:00 - " +  out1timetext	
		 			end
				else
					summary =  in1timetext	+ " - " +  out1timetext + "\n" + in2timetext += " - "
					if (rec.out2 != nil)
						summary += out2timetext	
					end
				end
			end
		end
		summary
	end

	
	def calcHours(rec)
		hours = 0
		if (rec.in1==nil) 
			hours = 0
		else 
			if (rec.out1 == nil) 
				hours = 0
			else
				if (rec.in2 == nil) 
					hours = (rec.out1.to_f - rec.in1.to_f)/3600
					if (hours > 4) 
						summary =  rec.in1.strftime('%H:%M')	+ " - 12:00\n13:00 - " +  rec.out1.strftime('%H:%M')	
						hours -= 1
		 			end
				else
					hours = (rec.out1.to_f - rec.in1.to_f)/3600
					if (rec.out2 != nil)
						hours += (rec.out2.to_f - rec.in2.to_f)/3600
					end
				end
			end
		end
		hours	
	end

						
					

	def signin
		tr = TimeRecord3.new
		currtime = Time.now
		t = currtime.to_time
		t = time_to_nearest_quarter_hour(t)
		tr.time = currtime
		tr.recordtype = "in"
	
  		tr.save

		currdate = currtime.to_date
		dr = DayRecord5.find_by logdate: currdate
		if (!dr)
			dr = DayRecord5.new
			dr.logdate = currdate
			dr.in1 = t
			
		#	dr.inout = t.strftime('%H:%M')
		#	dr.hours = 1.0
		else
			if (dr.out1 != nil)
				dr.in2 = t
			end
		end
		dr.save
		dr.summary = formatTime(dr)
		dr.hours = calcHours(dr)
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
		t = time_to_nearest_quarter_hour(t)
		tr.time = currtime
		tr.recordtype = "out"
	
  		tr.save

		currdate = currtime.to_date
		dr = DayRecord5.find_by logdate: currdate
		if (dr)
			if (dr.out1 == nil)
				dr.out1 = t
			else
				dr.out2 = t
			end
			dr.save
			dr.summary = formatTime(dr)
			dr.hours = calcHours(dr)
			dr.save
		end

		
		redirect_to timerecorder_index_path

	end

	def new
	end

	def create
	end

	def show
	end

	def index
		@dr = DayRecord5.all
  		@tr = TimeRecord3.all
	end

end
