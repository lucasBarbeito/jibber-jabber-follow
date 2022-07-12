class FollowsController < ApplicationController
  before_action :authenticate_user
  before_action :set_follow, only: %i[ show update toggle ]

  # GET /follows
  def index
    @follows = Follow.all

    render json: @follows
  end

  # GET /follows/1
  def show
    render json: { isFollowed: !@follow.nil? }
  end

  # POST /follows
  def create
    follower_keycloak_id = current_user_keycloak_id
    followed_keycloak_id = params['id']

    @follow = Follow.new(followed_user_id: followed_keycloak_id, follower_user_id: follower_keycloak_id)

    if @follow.save
      follow = {
        id: @follow.id,
        follower_user_id: @follow.follower_user_id,
        followed_user_id: @follow.followed_user_id,
      }
      render json: follow, status: :created
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/1
  def destroy(follow)
    follow.destroy
  end

  def toggle
    follower_keycloak_id = current_user_keycloak_id
    followed_keycloak_id = params['id']

    if Follow
         .where(followed_user_id: followed_keycloak_id)
         .where(follower_user_id: follower_keycloak_id)
         .exists?
      destroy(@follow)
    else
      create
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find_by_followed_user_id(params[:id])
    end

    def current_user_keycloak_id
      decoded_token = @decoded_token[0]
      decoded_token['sub']
    end
end
