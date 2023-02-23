class PlantTagsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end
  
  def create
    raise
    @tag = Tag.find(params[:plant_tag][:tag])
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new(tag: @tag, plant: @plant)
    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
