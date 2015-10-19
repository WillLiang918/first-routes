class ContactSharesController < ApplicationController

  def create
    @share = ContactShare.new(cont_share_params)
    if @share.save
      render json: @share
    else
      render json: @share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @share = ContactShare.find_by_id(params[:id])
    ContactShare.delete(params[:id])
    render json: @share
  end

  private
    def cont_share_params
      params[:contact_share].permit(:contact_id, :user_id)
    end
end
