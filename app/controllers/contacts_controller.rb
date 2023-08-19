class ContactsController < ApplicationController
  before_action :authenticate_admin!, except: %i[ index new confirm create ]
  before_action :set_contact, only: %i[ update show ]

  def index
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new unless @contact.valid?
  end

  def update
    @contact.update(contact_params)
    redirect_back fallback_location: admins_path
  end

  def new_inquiry
    @contacts = Contact.where(work_status: 'new_inquiry')
  end

  def working_inquiry
    @contacts = Contact.where(work_status: 'working_inquiry')
  end

  def past_inquiry
    @contacts = Contact.where(work_status: 'past_inquiry')
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :company_name, :telephone_number, :email, :content, :work_status)
  end
end
