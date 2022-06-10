class FollowsController < ApplicationController
  before_action :set_follow, only: %i[ show update destroy ]

  # GET /follows
  def index
    @follows = Follow.all

    render json: @follows
  end

  # GET /follows/1
  def show
    render json: @follow
  end

  # POST /follows
  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      render json: @follow, status: :created, location: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /follows/1
  def update
    if @follow.update(follow_params)
      render json: @follow
    else
      render json: @follow.errors, status: :unprocessable_entity
    end
  end

  # DELETE /follows/1
  def destroy
    @follow.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_follow
      @follow = Follow.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      keycloak_id = Keycloak::Helper.current_user_id(request.env)
      params.require(:follow).permit(:followed_user_id).merge(follower_id: keycloak_id)
    end
end
