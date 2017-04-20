class PhonesController < ApplicationController
	load_and_authorize_resource

	def index
		@contact = Contact.find(params[:contact_id])
		@phones = @contact.phones.all
	end

	def create
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.create(phone_params)
		redirect_to contact_phones_path(@contact)
	end

	def destroy
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.find(params[:id])
		@phone.destroy
		redirect_to contact_phones_path(@contact)
	end

	private
		def phone_params
			params.require(:phone).permit(:nphone, :status)
		end
end
