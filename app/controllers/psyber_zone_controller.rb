class PsyberZoneController < ApplicationController
  protect_from_forgery :except => [:send_from_unity]
  def index
  end

  def show
  end

  def send_from_unity
    record = PsyberZoneRecord.find_by(player_id: params[:player_id])
    if record
      record.name = params[:name]
      if params[:score].to_i > record.score.to_i
        record.score = params[:score]
      end
      record.save
    else
      new_record = PsyberZoneRecord.new(
          player_id: params[:player_id],
          name: params[:name],
          score: params[:score]
      )
      new_record.save
    end
  end

  def receive_from_unity
    records_raw = PsyberZoneRecord.all.order(score: :desc)
    records_set = {}
    records = []
    records_raw.each do |record_raw|
      record = {}
      record[:playerId] = record_raw.player_id
      record[:name] = record_raw.name
      record[:score] = record_raw.score
      record[:date] = record_raw.updated_at.strftime("%Y/%m/%d")

      records.append(record)
    end

    records_set[:records] = records
    render json: records_set
  end
end
