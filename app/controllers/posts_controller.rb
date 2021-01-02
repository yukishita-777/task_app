class PostsController < ApplicationController
  
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "スケジュール登録が完了しました。"
      redirect_to :root
    else
      render "new"
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post = Post.new(post_params)
    if @post.update(post_params)
      flash[:notice] = "ID:#{@post.id}のスケジュールの編集が完了しました。"
      redirect_to :root
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました。"
    redirect_to :root
  end
  
  # ソート機能
  def search
    selection = params[:keyword]
    @posts = Post.sort(selection)
  end
  
  
  private
  def post_params
    params.require(:post).permit(:title, :start_day, :finish_day, :memo)
  end
end
