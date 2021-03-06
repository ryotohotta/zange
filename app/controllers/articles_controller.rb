class ArticlesController < ApplicationController
  before_filter :require_login, except: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
    @users = User.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if signed_in?
      client = Twitter::REST::Client.new do |config|
        config.consumer_key         = "Qndxjz83ZuZHwm7LoN9VX0wzC"
        config.consumer_secret      = "BmrtnW4g97au2Zn3TFPZKH09oyZjFOIOCmco0j7PY5JUikk43e"
        config.access_token         = session[:oauth_token]
        config.access_token_secret  = session[:oauth_token_secret]
      end
      client.update("Zangeをして、Chigiriを結びました。zange.co #zange")
    end

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Zangeが投稿されました。' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Zangeが変更されました。' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Zangeが消去されました。' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :category, :solution, :deadline)
    end
end
