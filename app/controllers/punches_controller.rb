class PunchesController < ApplicationController
	before_action :find_punch, only: [:show, :edit, :update, :destroy, :upvote]
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@punches = Punch.all.order("created_at DESC")
	end

	def show
	end

	def new
		@punch = current_user.punches.build 
	end

	def create
		@punch = current_user.punches.build(punch_params)

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
		@punch.destroy
		redirect_to root_path
	end

	def upvote
		@punch.upvote_by current_user
		redirect_to :back
	end

	private
		def punch_params
			params.require(:punch).permit(:image, :title, :description)
		end

		def find_punch
			@punch = Punch.find(params[:id])
		end
end
