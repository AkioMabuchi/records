class CubicPuzzleController < ApplicationController
  protect_from_forgery except: [:send_stage]

  def send_stage
    stage = CubicPuzzleStage.new(
      title: params[:title],
      name: params[:name],
      floors: params[:floors],
      levels: params[:levels],
      objects: params[:objects]
    )

    stage.save!
  end

  def receive_stages
    raw_stages = CubicPuzzleStage.all.order(updated_at: :desc)

    stages = []

    raw_stages.each do |raw_stage|
      stage = {
        title: raw_stage.title,
        name: raw_stage.name,
        floors: raw_stage.floors,
        levels: raw_stage.levels,
        objects: raw_stage.objects
      }

      stages.append stage
    end

    output = {
      stages: stages
    }

    render json: output
  end
end
