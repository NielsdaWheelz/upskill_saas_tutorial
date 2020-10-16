class ContactsController < ApplicationController
  def new
    @contact = Contact.new #now every time someone pulls up the page, rails will create a new Contact instance variable. can refer to this in the HTML
  end
  
  def create
    @contact = Contact.new(contact_params) #to get it to actually save it to the db
    if @contact.save
      redirect_to new_contact_path, notice: "Message sent" #if saved, send user back to the page with a message
    else
      redirect_to new_contact_path, notice: "Error. Message not sent"
    end
  end
  
  private #for security
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end