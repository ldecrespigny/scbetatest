class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    session[:customer_params] ||= {}
    @customer = Customer.new(session[:customer_params])
    @customer.current_step = session[:customer_step]
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    session[:customer_params].deep_merge!(params[:customer]) if params[:customer]
    @customer = Customer.new(session[:customer_params])
    @customer.current_step = session[:customer_step]
    
    if params[:back_button]
      @customer.previous_step
    elsif @customer.last_step?
      @customer.save
    else
      @customer.next_step
    end
    session[:customer_step] = @customer.current_step
    if @customer.new_record?
      render "new"
    else
      session[:customer_step] = session[:customer_params] = nil
      redirect_to @customer
    end
  end


  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:cell, :email, :employees,:employees2,:employees3,:name, :function)
    end


end

