class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  load_and_authorize_resource
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    if params[:search]

        session[:city_name] = "#{params[:search].downcase}"
        @stores = Store.all.where('lower(city) = ?',"#{session[:city_name]}")
        @downcased = Store.pluck(:city).map(&:downcase)
        unless @downcased.include? "#{session[:city_name]}"
           flash.now[:alert] = "No stores for the city '#{session[:city_name]}' yet! Please seach something else.. "
        end
    elsif session[:city_name]
      flash.now[:notice]= "you have selected '#{session[:city_name]}' as your city."
      @stores = Store.all.where('lower(city) = ?',"#{session[:city_name]}")
      @downcased = Store.pluck(:city).map(&:downcase)
      unless @downcased.include? "#{session[:city_name]}"
         flash.now[:alert] = "No stores for the city '#{session[:city_name]}' yet! Please seach something else.. "
      end

    else
      flash.now[:notice] = "please select a city to begin!"
    end
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def city

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :street, :city, :zip, :phone, :website)
    end
end
