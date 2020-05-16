class Api::ContactsController < ApplicationController
  def create
  	@contact = Contact.new(contact_params)
  	if @contact.save
  		success_message = 'Message has been sent successfully'
  		render json: { result: "success", status: "success", message: success_message }
  	else
  		error_message = 'Please fill up all mandatory fields'
  		render json: { result: "failure", status: "failure", message: error_message }
  	end
  end

  def contact_params
  	params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)  
  end
end
