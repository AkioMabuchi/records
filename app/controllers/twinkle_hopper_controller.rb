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
      player.hopper_color_hue = params[:hopper_color_hue].to_f
      player.save!
    else
      raise StandardError
    end
  end

  def receive_player_information
    player = TwinkleHopperPlayer.find_by(player_token: params[:token])

    if player
      information = {
        PlayerName: player.player_name,
        HopperColorHue: player.hopper_color_hue
      }

      render json: information
    else
      raise StandardError
    end
  end

  def send_information
    player = TwinkleHopperPlayer.find_by(player_token: params[:player_token])

    if player
      information = player.information
      if information
        information.position_x = params[:position_x]
        information.position_y = params[:position_y]
        information.position_z = params[:position_z]
        information.rotation_w = params[:rotation_w]
        information.rotation_x = params[:rotation_x]
        information.rotation_y = params[:rotation_y]
        information.rotation_z = params[:rotation_z]
        information.velocity_x = params[:velocity_x]
        information.velocity_y = params[:velocity_y]
        information.angular_velocity = params[:angular_velocity]
        information.jump_count = params[:jump_count]
        information.time_count = params[:time_count]

        information.save!
      else
        new_information = TwinkleHopperInformation.new(
          player_id: player.id,
          position_x: params[:position_x],
          position_y: params[:position_y],
          position_z: params[:position_z],
          rotation_w: params[:rotation_w],
          rotation_x: params[:rotation_x],
          rotation_y: params[:rotation_y],
          rotation_z: params[:rotation_z],
          velocity_x: params[:velocity_x],
          velocity_y: params[:velocity_y],
          angular_velocity: params[:angular_velocity],
          jump_count: params[:jump_count],
          time_count: params[:time_count]
        )

        new_information.save!
      end
    else
      raise StandardError
    end
  end

  def send_information_2

  end

  def receive_information
    raw_records = TwinkleHopperInformation.joins(:player)
    records = []

    raw_records.each do |raw_record|
      record = {
        PlayerId: raw_record.player.player_token,
        PlayerName: raw_record.player.player_name,
        HopperColorHue: raw_record.hopper_color_hue,
        HopperPositionX: raw_record.position_x,
        HopperPositionY: raw_record.position_y,
        HopperPositionZ: raw_record.position_z,
        HopperRotationW: raw_record.rotation_w,
        HopperRotationX: raw_record.rotation_x,
        HopperRotationY: raw_record.rotation_y,
        HopperRotationZ: raw_record.rotation_z,
        HopperVelocityX: raw_record.velocity_x,
        HopperVelocityY: raw_record.velocity_y,
        HopperAngularVelocity: raw_record.angular_velocity,
        HopperJumpCount: raw_record.jump_count,
        TimeCount: raw_record.time_count
      }

      records.append record
    end

    output = {
      PlayerHopperRecords: records
    }

    render json: output
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
