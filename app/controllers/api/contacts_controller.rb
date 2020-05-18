class Api::ContactsController < ApplicationController

  def create
    I18n.locale = params[:contact][:locale].to_sym
    @contact = Contact.new(contact_params)
    if @contact.save
      success_message = t("validation.success")
      render json: { result: "success", status: "success", message: success_message }
    else
      error_message = success_message = t("validation.error")
      render json: { result: "failure", status: "failure", message: error_message }
    end
  end

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
  end
end
