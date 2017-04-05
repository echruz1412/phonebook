class AlamatsController < ApplicationController
  def create
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.create(alamat_params)
    redirect_to contact_path(@contact)
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @alamat = @contact.alamats.find(params[:id])
    @alamat.destroy
    redirect_to contact_path(@contact)
  end

  private
    def alamat_params
      params.require(:alamat).permit(:address)
    end
end
