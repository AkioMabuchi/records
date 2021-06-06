class TwinkleHopperController < ApplicationController
  protect_from_forgery except: [:send_record]

  def send_record
    record = TwinkleHopperRecord.find_by(player_id: params[:player_id])
    if record
      if params[:clear_time].to_i < record.clear_time
        record.player_name = params[:player_name]
        record.clear_time = params[:clear_time]
        record.save!
      end
    else
      new_record = TwinkleHopperRecord.new(
        player_id: params[:player_id],
        player_name: params[:player_name],
        clear_time: params[:clear_time]
      )

      new_record.save!
    end
  end

  def receive_records
    raw_records = TwinkleHopperRecord.order(clear_time: :asc)
    records = []

    raw_records.each do |raw_record|
      record = {
        playerId: raw_record.player_id,
        playerName: raw_record.player_name,
        time: raw_record.clear_time,
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
