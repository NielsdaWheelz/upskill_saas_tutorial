class ContactsController < ApplicationController
    def new
        @contact = Contact.new #now everytime someone goes to the form page, rails will create a new blank object (consisting of the items you described in the db) and stores it in this "@contact" instance variable. you can refer to this @contact in the View html file
    end
    
    def create
        @contact = Contact.new(contact_params)
        if @contact.save
            redirect_to new_contact_path, notice: "Message sent."
        else
            redirect_to new_contact_path, note: "Error occurred, message not sent."
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end