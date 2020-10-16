class ContactsController < ApplicationController
  def new
    @contact = Contact.new #now every time someone pulls up the page, rails will create a new Contact instance variable (list of blanks). can refer to this in the HTML
  end
  
  def create #saves to db
    @contact = Contact.new(contact_params) #contact_params assigns all the values to all the attributes of the object (aka list)
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