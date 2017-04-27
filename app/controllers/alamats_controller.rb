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
        redirect_to contact_alamats_path(@contact)
      else
        render :edit
      end
  end

  def index
    @contact = Contact.find(params[:contact_id])
    @alamats = @contact.alamats.all
  end

  def create
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.create(alamat_params)
    redirect_to contact_alamats_path(@contact)
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.find(params[:id])
    @alamat.destroy
    redirect_to contact_alamats_path(@contact)
  end

  private
    def alamat_params
      params.require(:alamat).permit(:address)
    end
end
