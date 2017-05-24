class PhonebookController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin == true
        @members = User.all
        @contacts = Contact.all
        @phones = Phone.all
      else
        @members = User.all
        @contacts = current_user.contacts.all
        @phones = current_user.contacts.joins("LEFT JOIN phones ON phones.contact_id = contacts.id").distinct
      end
  	else
  		@members = User.all
  		@contacts = Contact.all
  		@phones = Phone.all
    end
  end
end
