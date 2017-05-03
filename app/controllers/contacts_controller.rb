class ContactsController < ApplicationController
	load_and_authorize_resource 
	
	def index
		@contacts = Contact.order(:name).accessible_by(current_ability).page(params[:page]).per(5)
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
	    	flash[:success] = "Update Contact Success"
	    	redirect_to contacts_path 
	    else
	    	flash[:error] = "Update Contact Failed"
	    	render :edit
	    end
	end

	def create
		@contact = current_user.contacts.new(contact_params)
		if @contact.save
		  flash[:success] = "Create Contact Success"
		  redirect_to contacts_path
		else
		  flash[:error] = "Create Contact Failed"
		  render :new
		end
	end

	def destroy
	   @contact = Contact.find(params[:id])
	   @contact.destroy

	   flash[:success] = "Delete Contact Success"
	   redirect_to contacts_path
	end

	private
		def contact_params
			params.require(:contact).permit(:name, :avatar)
		end
end
