class PostsController < ApplicationController

  before_action :find_subject

  before_action :authenticate_user!, except: [:show]

  def new
    @post = @subject.posts.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = @subject.posts.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to subject_path(@subject)
    else
      render :new
    end
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to subject_path(@subject)
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])

    @post.destroy
    redirect_to subject_path(@subject)
  end

  def upvote
    @post = @subject.posts.find(params[:id])

    @post.upvote_by current_user
    redirect_to :back
  end

  def show
    @post = @subject.posts.find(params[:id])
  end

  private

  def find_subject
    @subject = Subject.find(params[:subject_id])
  end

  def post_params
    params.require(:post).permit(:image, :content)
  end
end