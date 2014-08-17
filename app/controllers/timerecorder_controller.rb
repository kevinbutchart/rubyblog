class TimerecorderController < ApplicationController
	def signin
		tr = TimeRecord3.new
		tr.time = Time.now
		tr.recordtype = "in"
	
  		tr.save
  		@tr = TimeRecord3.all
		render 'index'
	end

	def signout
		tr = TimeRecord3.new
		tr.time = Time.now
		tr.recordtype = "out"
	
  		tr.save
  		@tr = TimeRecord3.all
		render 'index'
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
