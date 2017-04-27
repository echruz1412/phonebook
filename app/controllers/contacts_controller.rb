class ContactsController < ApplicationController
	load_and_authorize_resource 
	
	def index
		@contacts = Contact.order(:name).accessible_by(current_ability).order('created_at DESC').page params[:page]
	end

	def new
		@contact = Contact.new
	end

	def edit
	  	@contact = Contact.find(params[:id])
	end

	def update
	    @contact = Contact.find(params[:id])
	 
	    if @contact.update(contact_params)
	    	redirect_to contacts_path
	    else
	    	render :edit
	    end
	end

	def create
		@contact = current_user.contacts.new(contact_params)
		if @contact.save
		  redirect_to contacts_path
		else
		  render :new
		end
	end

	def destroy
	   @contact = Contact.find(params[:id])
	   @contact.destroy

	   redirect_to contacts_path
	end

	private
		def contact_params
			params.require(:contact).permit(:name, :avatar)
		end
end
