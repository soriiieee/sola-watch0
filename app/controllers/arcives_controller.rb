class ArcivesController < ApplicationController
  before_action :set_arcife, only: [:show, :edit, :update, :destroy]

  # GET /arcives
  # GET /arcives.json
  def index
    @arcives = Arcive.all
  end

  # GET /arcives/1
  # GET /arcives/1.json
  def show
  end

  # GET /arcives/new
  def new
    @arcife = Arcive.new
  end

  # GET /arcives/1/edit
  def edit
  end

  # POST /arcives
  # POST /arcives.json
  def create
    @arcife = Arcive.new(arcife_params)

    respond_to do |format|
      if @arcife.save
        format.html { redirect_to @arcife, notice: 'Arcive was successfully created.' }
        format.json { render :show, status: :created, location: @arcife }
      else
        format.html { render :new }
        format.json { render json: @arcife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arcives/1
  # PATCH/PUT /arcives/1.json
  def update
    respond_to do |format|
      if @arcife.update(arcife_params)
        format.html { redirect_to @arcife, notice: 'Arcive was successfully updated.' }
        format.json { render :show, status: :ok, location: @arcife }
      else
        format.html { render :edit }
        format.json { render json: @arcife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arcives/1
  # DELETE /arcives/1.json
  def destroy
    @arcife.destroy
    respond_to do |format|
      format.html { redirect_to arcives_url, notice: 'Arcive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arcife
      @arcife = Arcive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arcife_params
      params.require(:arcife).permit(:name, :start_time)
    end
end
