
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = User.find(session[:user_id])
    if @post.save
      flash[:notice] = "Crime added to your rapsheet!"
      redirect_to @post.user
    else
      flash[:alert] = "Oy! Something went wrong"
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Crime updated!"
      redirect_to @post.user
    else
      flash[:alert] = "Sometihing went wrong. Check yoself!"
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    if @post.delete
      flash[:notice] = "You have been acquitted of a crime"
      redirect_to @post.user
    else
      flash[:alert] = "Still a felony. Sometihing went wrong!"
      redirect_to :back
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_chirp
    @post = Post.find(params[:id])
  end
end
