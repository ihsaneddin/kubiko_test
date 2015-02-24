class CreditChargesController < ApplicationController
  before_action :set_credit_charge, only: [:show, :edit, :update, :destroy]

  # GET /credit_charges
  # GET /credit_charges.json
  def index
    @credit_charges = CreditCharge.includes(:customer).all
  end

  # GET /credit_charges/1
  # GET /credit_charges/1.json
  def show
  end

  # GET /credit_charges/new
  def new
    @credit_charge = CreditCharge.new
  end

  # GET /credit_charges/1/edit
  def edit
  end

  # POST /credit_charges
  # POST /credit_charges.json
  def create
    @credit_charge = CreditCharge.new(credit_charge_params)

    respond_to do |format|
      if @credit_charge.save
        format.html { redirect_to @credit_charge, notice: 'Credit charge was successfully created.' }
        format.json { render :show, status: :created, location: @credit_charge }
      else
        format.html { render :new }
        format.json { render json: @credit_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_charges/1
  # PATCH/PUT /credit_charges/1.json
  def update
    respond_to do |format|
      if @credit_charge.update(credit_charge_params)
        format.html { redirect_to @credit_charge, notice: 'Credit charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_charge }
      else
        format.html { render :edit }
        format.json { render json: @credit_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_charges/1
  # DELETE /credit_charges/1.json
  def destroy
    @credit_charge.destroy
    respond_to do |format|
      format.html { redirect_to credit_charges_url, notice: 'Credit charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_charge
      @credit_charge = CreditCharge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_charge_params
      params.require(:credit_charge).permit(:paid, :amount, :created, :currency, :refunded, :customer_id, :disputed)
    end
end
