class SatelightsController < ApplicationController
  before_action :set_satelight, only: [:show, :edit, :update, :destroy]

  # GET /satelights
  # GET /satelights.json
  def index
    @satelights = Satelight.all
  end

  # GET /satelights/1
  # GET /satelights/1.json
  def show
  end

  # GET /satelights/new
  def new
    @satelight = Satelight.new
  end

  # GET /satelights/1/edit
  def edit
  end

  # POST /satelights
  # POST /satelights.json
  def create
    @satelight = Satelight.new(satelight_params)

    respond_to do |format|
      if @satelight.save
        format.html { redirect_to @satelight, notice: 'Satelight was successfully created.' }
        format.json { render :show, status: :created, location: @satelight }
      else
        format.html { render :new }
        format.json { render json: @satelight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /satelights/1
  # PATCH/PUT /satelights/1.json
  def update
    respond_to do |format|
      if @satelight.update(satelight_params)
        format.html { redirect_to @satelight, notice: 'Satelight was successfully updated.' }
        format.json { render :show, status: :ok, location: @satelight }
      else
        format.html { render :edit }
        format.json { render json: @satelight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /satelights/1
  # DELETE /satelights/1.json
  def destroy
    @satelight.destroy
    respond_to do |format|
      format.html { redirect_to satelights_url, notice: 'Satelight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_satelight
      @satelight = Satelight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def satelight_params
      params.require(:satelight).permit(:name1, :name2, :name3)
    end
end
