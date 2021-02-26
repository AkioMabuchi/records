class Unity1week18thController < ApplicationController
  protect_from_forgery except: [:send_record]

  def send_record
    record = NeondromeRecord.new(
        player_id: params[:player_id],
        name: params[:name],
        score: params[:score]
    )

    record.save!
  end

  def receive_records
    raw_records = NeondromeRecord.order(score: :desc)
    records = []

    raw_records.each do |raw_record|
      record = {
          playerId: raw_record.player_id,
          name: raw_record.name,
          score: raw_record.score,
          date: raw_record.updated_at.strftime("%Y/%m/%d")
      }
      records.append record
    end
    output = {
        records: records
    }
    render json: output
  end
end
