class Unity1week16thController < ApplicationController
  protect_from_forgery :except => [:send_from_unity]
  def index
    @records = Unity1week16thRecord.all
  end

  def show
  end

  def send_from_unity e
    record = Unity1week16thRecord.new(user: params[:name], score: params[:score])
    record.save
  end

  def receive_from_unity
    records = Unity1week16thRecord.all
    render json: records
  end
end
