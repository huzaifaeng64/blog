class PatientsController < ApplicationController
	def show
		@patient = Patient.find(params[:id])
	end

	def index
		@patient = Patient.all
	end

	def destroy
	end

	def new
		@patient = Patient.new
	end

	def edit
		@patient = Patient.find(params[:id])
	end

	def create
		@patient = Patient.new(params.require(:patient).permit(:name))
		if @patient.save
			redirect_to @patient
		else
			render 'new'
		end
	end

	def update
		@patient = Patient.find(params[:id])
		if @patient.update(params.require(:patient).permit(:name))
			redirect_to @patient
		else
			render 'edit'
		end
	end
end
