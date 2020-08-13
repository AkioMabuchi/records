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
      if params[:score] > record.score
        record.score = params[:score]
      end
    else
      record = PsyberZoneRecord.new(
          player_id: pamras[:player_id],
          name: params[:name],
          score: params[:score]
      )
    end

    record.save
  end

  def receive_from_unity
    records_raw = PsyberZoneRecord.all
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
