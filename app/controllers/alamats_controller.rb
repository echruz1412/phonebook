class AlamatsController < ApplicationController
  load_and_authorize_resource :contact
  load_and_authorize_resource :alamat, :through => :contact

  def new
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.new
  end

  def edit
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.find(params[:id])
   
      if @alamat.update(alamat_params)
        flash[:success] = "Update Address Success"
        redirect_to contact_alamats_path(@contact)
      else
        flash[:error] = "Update Address Fail"
        render :edit
      end
  end

  def index
    @contact = Contact.find(params[:contact_id])
    @alamats = @contact.alamats.order(:address).page(params[:page]).per(5)
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.create(alamat_params)
    flash[:success] = "Create Address Success"
    redirect_to contact_alamats_path(@contact)
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.find(params[:id])
    @alamat.destroy
    flash[:success] = "Delete Address Success"
    redirect_to contact_alamats_path(@contact)
  end

  private
    def alamat_params
      params.require(:alamat).permit(:address)
    end
end
