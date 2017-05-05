class MembersController < ApplicationController
	load_and_authorize_resource :class => User
	
	def index
		if params[:search]
			@members = User.search(params[:search]).page(params[:page]).per(5)
		else
			@members = User.all.page(params[:page]).per(5)
		end
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
		  flash[:danger] = "Create User Failed"
		  render "_new.html.erb"
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
	    	flash[:danger] = "Update User Failed"
	    	render "_edit.html.erb"
	    end
	end

	def destroy
	   @member = User.find(params[:id])

	   if current_user == @member
	   	flash[:danger] = "User Online"
	   else
	   	@member.destroy
	   	flash[:success] = "Delete User Success"
	   end

	   redirect_to members_path
	end

	private
	def member_params
		params.require(:user).permit(:email, :password, :admin)
	end

end
