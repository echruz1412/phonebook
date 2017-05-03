class MembersController < ApplicationController
	load_and_authorize_resource :class => User
	
	def index
		@members = User.all
	end

	def new
		@member = User.new
	end

	def create
		@member = User.new(member_params)
		if @member.save
		  flash[:success] = "Create User Success"
		  redirect_to members_path
		else
		  flash[:error] = "Create User Failed"
		  render :new
		end
	end

	def edit
	   @member = User.find(params[:id])
	end

	def update
		@member = User.find(params[:id])
	 
		if params[:user][:password].blank?
			params[:user].delete :password
			params[:user].delete :password_confirmation
		end

	    if @member.update(member_params)
	    	flash[:success] = "Update User Success"
	    	redirect_to members_path 
	    else
	    	flash[:error] = "Update User Failed"
	    	render :edit
	    end
	end

	def destroy
	   @member = User.find(params[:id])
	   @member.destroy

	   flash[:success] = "Delete User Success"
	   redirect_to members_path
	end

	private
	def member_params
		params.require(:user).permit(:email, :password, :admin)
	end

end
