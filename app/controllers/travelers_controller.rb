class TravelersController < ApplicationController
  # might not need this before action since its in the application controller
  before_action :authenticate_traveler

  before_action :set_traveler, only: [:show, :update, :destroy]

  # NOTE: (FOR AUTHENTICATING TRAVELER)
  # You can access the current traveler in your controller with current_user.
  # You also have access directly to current_traveler which will try to authenticate or return nil:
    #   def index
    #     if current_user
    #       # do something
    #     else
    #       # do something else
    #     end
    #   end

  # this was a test
  def index
    # return all of the travelers
    # travelers = Traveler.all
    # if travelers.length >= 1
    #   render json: travelers.as_json(except: [:updated_at, :created_at]), status: :ok
    # else
    #   render json: { no_travelers: "Travelers were not found" }, status: :not_found
    # end

    @travelers = Traveler.all
    render json: @travelers, each_serializer: TravelerSerializer

  end

  def show
    render json: @traveler, serializer: TravelerSerializer
  end

  def create
    @traveler = Traveler.new(traveler_params)

    if @traveler.save
      render status: :ok, json: {first_name: traveler.first_name}
    else
      render status: :bad_request, json: { errors: traveler.errors.messages }
    end
  end

  def update
    if @traveler.update(traveler_params)
      render json: @traveler
    else
      render json: @traveler.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @traveler.destroy
  end


  private
  def set_traveler
    @traveler = Traveler.find(params[:id])
  end

  # allowed info to prevent bad data
  def traveler_params
    params.require(:traveler).permit(:first_name, :last_name, :email)
  end

end
