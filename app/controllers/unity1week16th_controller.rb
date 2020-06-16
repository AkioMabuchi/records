class Unity1week16thController < ApplicationController
  protect_from_forgery :except => [:send_from_unity]
  def index
    @records = Unity1week16thRecord.all
  end

  def show
  end

  def send_from_unity
    record = Unity1week16thRecord.new(user: params[:name], score: params[:score])
    record.save
  end

  def receive_from_unity
    records_raw = Unity1week16thRecord.all
    records = []
    records_raw.each do |record_raw|
      record = {}
      record[:name] = record_raw.user
      record[:score] = record_raw.score
      record[:date] = record_raw.updated_at.strftime("%Y/%m/%d")

      records.append(record)
    end
    render json: records
  end
end
