class TimerecorderController < ApplicationController
	def signin
		@tr = TimeRecord3.new
		@tr.time = Time.now
		@tr.recordtype = "in"
	
  		@tr.save
		redirect_to 'index'
	end

	def signout
	end

	def new
	end

	def create
	end

	def show
	end

	def index
  		@tr = TimeRecord3.all
	end

end
