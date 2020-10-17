class ContactsController < ApplicationController
  def new
    @contact = Contact.new #now every time someone pulls up the page, rails will create a new Contact instance variable (list of blanks). can refer to this in the HTML. The capital in 'Contact' tells rails to read the corresponding 'models' file
  end
  
  def create #saves to db
    @contact = Contact.new(contact_params) #contact_params assigns all the values to all the attributes of the object (aka list)
    if @contact.save
      flash[:success] = "Message sent"
      redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private #for security
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end