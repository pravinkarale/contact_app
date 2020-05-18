class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    respond_to do |format|
      format.js
      format.html
    end
  end
end
