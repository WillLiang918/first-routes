class ContactsController < ApplicationController

  def index
    contacts = User.find(params[:user_id]).all_my_contacts
    render json: contacts
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find_by_id(params[:id])
    Contact.delete(params[:id])
    render json: @contact
  end

  def show
    @contact = Contact.find_by_id(params[:id])
    render json: @contact
  end

  def update
    @contact = Contact.find_by_id(params[:id])
    if @contact
      @contact.update(contact_params)
      render json: @contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
    def contact_params
      params[:contact].permit(:name, :email, :user_id)
    end
end
