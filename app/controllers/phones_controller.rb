class PhonesController < ApplicationController
	load_and_authorize_resource :contact
	load_and_authorize_resource :phone, :through => :contact

	def new
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.new
	end

	def index
		@contact = Contact.find(params[:contact_id])
		if params[:search]
			@phones = @contact.phones.search(params[:search]).order(:nphone).page(params[:page]).per(5)
		else
			@phones = @contact.phones.order(:nphone).page(params[:page]).per(5)
		end
	end

	def create
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.new(phone_params)
		if @phone.save
		  flash[:success] = "Create Phone Success"
		  redirect_to contact_phones_path(@contact)
		else
		  flash[:danger] = "Create Phone Fail"
	      render "_new.html.erb"
		end
	end

	def edit
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.find(params[:id])
	end

	def update
		binding.pry
		@contact = Contact.find(params[:contact_id])
		@phone = @contact.phones.find(params[:id])
	 	if @phone.update(phone_params)
	    	flash[:success] = "Update Phone Success"
	    	redirect_to contact_phones_path(@contact)
	    else
	    	flash[:danger] = "Update Phone Fail"
	    	render "_new.html.erb"
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
