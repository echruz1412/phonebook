class PhonesController < ApplicationController
	load_and_authorize_resource :contact
	load_and_authorize_resource :phone, :through => :contact

	def new
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.new
	end

	def index
		@contact = Contact.find(params[:contact_id])
		@phones = @contact.phones.all
	end

	def create
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.create(phone_params)
		flash[:success] = "Create Phone Success"
		redirect_to contact_phones_path(@contact)
	end

	def edit
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.find(params[:id])
	 
	    if @phone.update(phone_params)
	    	flash[:success] = "Update Phone Success"
	    	redirect_to contact_phones_path(@contact)
	    else
	    	flash[:error] = "Update Phone Fail"
	    	render :edit
	    end
	end

	def destroy
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.find(params[:id])
		@phone.destroy
		flash[:success] = "Delete Phone Success"
		redirect_to contact_phones_path(@contact)
	end

	private
		def phone_params
			params.require(:phone).permit(:nphone, :status)
		end
end
