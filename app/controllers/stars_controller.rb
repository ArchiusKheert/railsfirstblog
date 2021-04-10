class StarsController < ApplicationController
  before_action :set_star, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index,:show]
  before_action :correct_user, only: [:edit,:update,:destroy]
  # GET /stars or /stars.json
  def index
    @stars = Star.all
  end

  # GET /stars/1 or /stars/1.json
  def show
  end

  # GET /stars/new
  def new
    #@star = Star.new
    @star = current_user.stars.build
  end

  # GET /stars/1/edit
  def edit
  end

  # POST /stars or /stars.json
  def create
    #@star = Star.new(star_params)
    @star = current_user.stars.build(star_params)

    respond_to do |format|
      if @star.save
        format.html { redirect_to @star, notice: "Star was successfully created." }
        format.json { render :show, status: :created, location: @star }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stars/1 or /stars/1.json
  def update
    respond_to do |format|
      if @star.update(star_params)
        format.html { redirect_to @star, notice: "Star was successfully updated." }
        format.json { render :show, status: :ok, location: @star }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @star.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stars/1 or /stars/1.json
  def destroy
    @star.destroy
    respond_to do |format|
      format.html { redirect_to stars_url, notice: "Star was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @star = current_user.stars.find_by(id: params[:id])
    redirect_to stars_path, notice: "Not authorized to edit" if @star.nil?
  end
    
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_star
      @star = Star.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def star_params
      params.require(:star).permit(:first_name, :last_name, :team, :country, :birth_date, :user_id)
    end
end
