class AdvertismentsController < ApplicationController
  before_action :set_advertisment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  @brands= Brand.all
  @variants = Variant.all
  # GET /advertisments
  # GET /advertisments.json
  def index
    @advertisments = Advertisment.all
    @variants = Variant.all
    @users = User.all
    @brands = Brand.all
    @brs = params['brand_id'].to_i
    
    @year = params['year'].to_i
    @distance = params['mileage'].to_i
    @price = [params['price_min'].to_i, params['price_max'].to_i]
    @f = params['fueltyp'].to_i - 1
    if(@brs !=0 ||@year !=0 || @distance != 0|| @price != 0)
      if(@brs != 0)
        @advertisments = @advertisments.where('brand_id = ?', @brs)
      end
      if(@year > 1950 && @year < 2050)
        @advertisments = @advertisments.where('year > ?', @year)
      end
      if(@f == 1 || @f == 0)
        @advertisments = @advertisments.where('fueltype = ?', @f)
      end
      if(@distance != 0)
        @advertisments = @advertisments.where('kmdriven < ?', @distance)
      end
      if(@price[0] != 0)
        @advertisments = @advertisments.where('price > ?', @price[0])
      end
      if(@price[1] != 0)
        @advertisments = @advertisments.where('price < ?', @price[1])
      end
    end
    
  end

  # GET /advertisments/1
  # GET /advertisments/1.json
  def show
    @brands = Brand.all
    @variants = Variant.all
  end

  # GET /advertisments/new
  def new
    @advertisment = Advertisment.new
    @brands = Brand.all
    @variants = Variant.all
  end

  # GET /advertisments/1/edit
  def edit
    @advertisment = Advertisment.new
    @brands = Brand.all
    @variants = Variant.all
  end

  # POST /advertisments
  # POST /advertisments.json
  def create
    @advertisment = Advertisment.new(advertisment_params)
    @advertisment.user_id = current_user.id
    @advertisment.brand_id = params[:brand_id]
    @advertisment.variant_id = params[:varientid]
    respond_to do |format|
      if @advertisment.save
        format.html { redirect_to @advertisment, notice: 'Advertisment was successfully created.' }
        format.json { render :show, status: :created, location: @advertisment }
      else
        format.html { render :new }
        format.json { render json: @advertisment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisments/1
  # PATCH/PUT /advertisments/1.json
  def update
    respond_to do |format|
      if @advertisment.update(advertisment_params)
        format.html { redirect_to @advertisment, notice: 'Advertisment was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisment }
      else
        format.html { render :edit }
        format.json { render json: @advertisment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisments/1
  # DELETE /advertisments/1.json
  def destroy
    @advertisment.destroy
    respond_to do |format|
      format.html { redirect_to advertisments_url, notice: 'Advertisment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisment
      @advertisment = Advertisment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisment_params
      params.require(:advertisment).permit(:year, :kmdriven, :ownercount, :price, :color, :fueltype, :brand_id, :user_id, :variant_id)
    end
end
