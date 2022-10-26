class ArticlesController < ApplicationController
    before_action :set_article, only: %i[ show edit update destroy ]
  
    def index
      @articles = Article.all
      #byebug
    end

    def show
    end

    def new
      @article = Article.new
    end
  
    def edit
    end
  
    def create
      #byebug
      #@user = User.last
      @article = Article.new(article_params)
      if @article.save
        #session[:user_id] = @user.id
        #article.user_id = @user.id
        flash[:alert] = "Successfully signup"
        redirect_to @article
        else
          render 'new' 
       end
    end
  
    def update
        if @article.update(article_params)
            flash[:alert] = "Successfully updated"
            redirect_to @article
        else
          render 'edit'
          
        end
    end
  
    def destroy
      @article.destroy
      flash[:alert] = "Successfully destroyed."
      redirect_to articles_path
    end

    def delete_file
      file = ActiveStorage::Attachment.find(params[:id])
      file.purge
      redirect_back(fallback_location: articles_path)
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end
  
      def article_params
        params.require(:article).permit(:first_name, :last_name, :address, :description, :header_image, uploads: [])
      end
  end
  