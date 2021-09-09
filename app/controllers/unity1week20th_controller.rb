class Unity1week20thController < ApplicationController
  def send_stage
    stage = FloatingPuzzleStage.new(
      author: params[:author],
      stage_name: params[:stage_name],
      map_info: params[:map_info]
    )

    stage.save!
  end

  def receive_stages
    raw_stages = FloatingPuzzleStage.order(updated_at: :desc)
    stages = []

    raw_stages.each do |raw_stage|
      stage = {
        author: raw_stage.author,
        stageName: raw_stage.stage_name,
        map: raw_stage.map_info
      }

      stages.append stage
    end
    output = {
      stages: stages
    }

    render json: output
  end
end
