class PostsController < ApplicationController
  def index
    posts = Post.all
    render json: posts, status: :ok
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors }, status: :bad_request
    end
  end

  private

  def post_params
    params.permit(:category, :content)
  end
end
