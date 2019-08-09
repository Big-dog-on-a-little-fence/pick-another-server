class TuningsController < ApplicationController
  before_action :set_tuning, only: [:show, :edit, :update, :destroy]

  # GET /tunings
  # GET /tunings.json
  def index
    @tunings = Tuning.all
  end

  # GET /tunings/1
  # GET /tunings/1.json
  def show
    tune_includes = [:users_that_have_starred, :lyric, :charts, :genres,
                     :sources, :instruments]
    @q = @tuning.tunes.ransack(params[:q])
    @q.sorts = 'updated_at desc' if @q.sorts.empty?
    @tunes = @q.result.includes(tune_includes).page(params[:page]).per(100)
    @current_user_tunes = Tune.user_tunes(current_user)
    @user = current_user
  end

  # GET /tunings/new
  def new
    @tuning = Tuning.new
  end

  # GET /tunings/1/edit
  def edit
  end

  # POST /tunings
  # POST /tunings.json
  def create
    @tuning = Tuning.new(tuning_params)

    respond_to do |format|
      if @tuning.save
        format.html { redirect_to @tuning, notice: 'Tuning was successfully created.' }
        format.json { render :show, status: :created, location: @tuning }
      else
        format.html { render :new }
        format.json { render json: @tuning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tunings/1
  # PATCH/PUT /tunings/1.json
  def update
    respond_to do |format|
      if @tuning.update(tuning_params)
        format.html { redirect_to @tuning, notice: 'Tuning was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuning }
      else
        format.html { render :edit }
        format.json { render json: @tuning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tunings/1
  # DELETE /tunings/1.json
  def destroy
    @tuning.destroy
    respond_to do |format|
      format.html { redirect_to tunings_url, notice: 'Tuning was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuning
      @tuning = Tuning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuning_params
      params.require(:tuning).permit(:notes, :name, :instrument_type)
    end
end
