class PunchesController < ApplicationController
	before_action :find_punch, only: [:show, :edit, :update, :destroy]

	def index
		@punches = Punch.all.order("created_at DESC")
	end

	def show
	end

	def new
		@punch = Punch.new 
	end

	def create
		@punch = Punch.new(punch_params)

		if @punch.save
			redirect_to @punch, notice: "Successfully Created New Punch"
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @punch.update(punch_params)
			redirect_to @punch, notice: "Punch was successfully updated"
		else
			render 'edit'
		end
	end

	def destroy
		@pin.destroy
		redirect_to root_path
	end

	private
		def punch_params
			params.require(:punch).permit(:title, :description)
		end

		def find_punch
			@punch = Punch.find(params[:id])
		end
end
