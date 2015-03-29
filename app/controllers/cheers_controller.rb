class CheersController < ApplicationController
  before_action :set_cheer, only: [:show, :edit, :update, :destroy]

  # GET /cheers
  # GET /cheers.json
  def index
    @cheers = Cheer.all
  end

  # GET /cheers/1
  # GET /cheers/1.json
  def show
  end

  # GET /cheers/new
  def new
    @cheer = Cheer.new
  end

  # GET /cheers/1/edit
  def edit
  end

  # POST /cheers
  # POST /cheers.json
  def create
    @article = Article.find(params[:article_id])
    @cheer = Cheer.new(user_id: current_user.id, article_id: @article.id)

    respond_to do |format|
      if @cheer.save
        format.html { redirect_to  articles_path, notice: 'Cheer was successfully created.' }
        format.json { render :show, status: :created, location: @cheer }
      else
        format.html { render :new }
        format.json { render json: @cheer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheers/1
  # PATCH/PUT /cheers/1.json
  def update
    respond_to do |format|
      if @cheer.update(cheer_params)
        format.html { redirect_to @cheer, notice: 'Cheer was successfully updated.' }
        format.json { render :show, status: :ok, location: @cheer }
      else
        format.html { render :edit }
        format.json { render json: @cheer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheers/1
  # DELETE /cheers/1.json
  def destroy
    @cheer.destroy
    respond_to do |format|
      format.html { redirect_to cheers_url, notice: 'Cheer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheer
      @cheer = Cheer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cheer_params
      params.require(:cheer).permit(:user_id, :article_id)
    end
end
