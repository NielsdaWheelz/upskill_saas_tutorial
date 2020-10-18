class ContactsController < ApplicationController
  def new
    @contact = Contact.new #now every time someone pulls up the page, rails will create a new Contact instance variable (list of blanks). can refer to this in the HTML. The capital in 'Contact' tells rails to read the corresponding 'models' file
  end
  
  def create #saves to db
    @contact = Contact.new(contact_params) #contact_params assigns all the values to all the attributes of the object (aka list). will check the validation in the models file first
    if @contact.save
      name = params[:contact][:name] # params from 'contact_params'. go to the 'contact' form, grab the 'name' variable. params is a key:value table, and contact is a key:value table INSIDE of the params key:value table
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver
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