class Unity1week17thController < ApplicationController
  protect_from_forgery except: [:send_stage]

  def send_stage
    stage = FairyPuzzleOriginalStage.new(
        name: params[:name],
        title: params[:title],
        field: params[:field],
        mp: params[:mp]
    )

    stage.save!
  end

  def receive_stages
    raw_stages = FairyPuzzleOriginalStage.all.order(updated_at: :desc)

    stages = []

    raw_stages.each do |raw_stage|
      stage = {
          name: raw_stage.name,
          title: raw_stage.title,
          field: raw_stage.field,
          mp: raw_stage.mp
      }

      stages.append stage
    end

    output = {
        stages: stages
    }

    render json: output
  end
end
