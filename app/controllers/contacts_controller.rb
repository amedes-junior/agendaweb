class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @q = Contact.ransack(params[:q])
    @contacts = @q.result.order(:name).page(params[:page]).per(100)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    authorize @contact
  end

  # GET /contacts/1/edit
  def edit
      authorize @contact
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params.merge({ user_id: current_user.id }))
    authorize @contact
    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      authorize @contact
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    authorize @contact
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def export
     #render text: "chegou aqui"
     @contacts = Contact.all
     authorize @contacts
     respond_to do |format|
       format.pdf { render 'export.pdf.prawn' }
       format.json { render json: @contacts.to_json}
       format.xlsx { render xlsx: 'export.xlsx.axlsx', filename: "Contatos-#{I18n.l(Date.today)}.xlsx" }
       #format.xml { render xml: @contacts.to_xml}
     end
  end

  def dashboard
    @contacts = Contact.all
    #authorize @contacts
    respond_to do |format|
      format.json do
        render json: {
          data: [
            { name: Contact.genders_i18n[:male], y: @contacts.count_all_males },
            { name: Contact.genders_i18n[:female], y: @contacts.count_all_females }
          ]
        }.to_json
      end

      format.html { render :dashboard }
    end
  end

end
