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

    render json: receive_process(raw_stages)
  end

  def receive_official_stages
    raw_stages = CubicPuzzleStage.where(stage_no: [1..20]).order(stage_no: :asc)

    render json: receive_process(raw_stages)
  end

  def receive_edited_stages
    raw_stages = CubicPuzzleStage.where(stage_no: 0).order(updated_at: :desc)

    render json: receive_process(raw_stages)
  end

  private
  
  def receive_process(raw_stages)
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

    {
      stages: stages
    }
  end
end
