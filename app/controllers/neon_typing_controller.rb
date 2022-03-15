class NeonTypingController < ApplicationController
  protect_from_forgery except: [:send_record]

  def send_record
    record = NeonTypingRecord.find_by(player_id: params[:player_id])
    if record
      if params[:score].to_i > record.score
        record.player_name = params[:player_name]
        record.score = params[:score]
        record.save!
      end
    else
      new_record = NeonTypingRecord.new(
        player_id: params[:player_id],
        player_name:params[:player_name],
        score: params[:score]
      )
      new_record.save!
    end
  end

  def receive_records
    raw_records = NeonTypingRecord.order(score: :desc)
    records = []

    raw_records.each do |raw_record|
      record = {
        playerId: raw_record.player_id,
        playerName: raw_record.player_name,
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
