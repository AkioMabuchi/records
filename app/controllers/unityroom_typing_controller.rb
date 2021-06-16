class UnityroomTypingController < ApplicationController
  protect_from_forgery except: [:send_record]

  def send_record
    record = UnityroomTypingRecord.find_by(player_id: params[:player_id])
    if record
      if params[:typing_speed].to_i < record.typing_speed
        record.player_name = params[:player_name]
        record.time_count = params[:time_count]
        record.type_count = params[:type_count]
        record.miss_count = params[:miss_count]
        record.typing_speed = params[:typing_speed]
        record.accuracy = params[:accuracy]
        record.save!
      end
    else
      new_record = UnityroomTypingRecord.new(
        player_id: params[:player_id],
        player_name: params[:player_name],
        time_count: params[:time_count],
        type_count: params[:type_count],
        miss_count: params[:miss_count],
        typing_speed: params[:typing_speed],
        accuracy: params[:accuracy]
      )

      new_record.save!
    end
  end

  def receive_records
    raw_records = UnityroomTypingRecord.order(typing_speed: :desc, accuracy: :desc)
    records = []

    raw_records.each do |raw_record|
      record = {
        playerId: raw_record.player_id,
        playerName: raw_record.player_name,
        time: raw_record.time_count,
        typeCount: raw_record.type_count,
        missCount: raw_record.miss_count,
        speed: raw_record.typing_speed,
        accuracy: raw_record.accuracy,
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
