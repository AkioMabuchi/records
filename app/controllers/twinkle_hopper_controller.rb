class TwinkleHopperController < ApplicationController
  protect_from_forgery except: [
    :send_player_initialization,
    :send_player_information,
    :send_information,
    :send_information_2,
    :send_record,
    :send_record_2
  ]

  def send_player_initialization
    token = params[:player_token]

    unless TwinkleHopperPlayer.find_by(player_token: token)
      player = TwinkleHopperPlayer.new(
        player_token: token,
        player_name: sprintf( "Kurukuru%4d", rand(10000)),
        hopper_color_hue: rand
      )
      player.save!
    end
  end

  def send_player_information
    player = TwinkleHopperPlayer.find_by(player_token: params[:player_token])

    if player
      player.player_name = params[:player_name]
      player.hopper_color_hue = params[:hopper_color_hue]
      player.save!
    else
      raise StandardError
    end
  end

  def receive_player_information
    player = TwinkleHopperPlayer.find_by(player_token: params[:token])

    if player
      information = {
        player_id: player.player_token,
        player_name: player.player_name,
        hopper_color_hue: player.hopper_color_hue
      }

      render json: information
    else
      raise StandardError
    end
  end

  def send_information

  end

  def send_information_2

  end

  def receive_information

  end

  def receive_information_2

  end

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

  def send_record_2

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

  def receive_records_2

  end
end
