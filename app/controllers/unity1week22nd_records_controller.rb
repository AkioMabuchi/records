class Unity1week22ndRecordsController < ApplicationController
  def send_record
    record = Unity1week22ndRecord.where(picture_id: params[:picture_id]).find_by(player_id: params[:player_id])
    if record
      if params[:solve_time].to_i < record.solve_time
        record.player_name = params[:player_name]
        record.solve_time = params[:solve_time]
      else
        record.player_name = params[:player_name]
      end
      record.save!
    else
      new_record = Unity1week22ndRecord.new(
        player_id: params[:player_id],
        player_name: params[:player_name],
        picture_id: params[:picture_id],
        solve_time: params[:solve_time]
      )

      new_record.save!
    end
  end

  def receive_records
    records = []
    if params[:picture_id]
      raw_records = Unity1week22ndRecord.where(picture_id: params[:picture_id]).order(solve_time: :asc)
      raw_records.each do |raw_record|
        record = {
          playerId: raw_record.player_id,
          playerName: raw_record.player_name,
          pictureId: raw_record.picture_id,
          solveTime: raw_record.solve_time,
          date: raw_record.updated_at.strftime("%Y/%m/%d")
        }

        records.append record
      end
    end

    output = {
      records: records
    }

    render json: output
  end
end
