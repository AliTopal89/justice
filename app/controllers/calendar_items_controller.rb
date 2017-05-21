class CalendarItemsController < ApplicationController
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]

  def index
    @calendar_items = CalendarItem.where(start_time: params[:start_time]..params[:end_time])
  end

  def new
    @calendar_item = CalendarItem.new
  end

  def create
    @calendar_item = CalendarItem.new(calendar_params)
    @calendar_item.save
  end

  def update
    @calendar_item.update(calendar_params)
  end

  def edit
  end

  def destroy
    @calendar_item.destroy
  end

  def show
  end

  private
    def set_calendar
      @event = CalendarItem.find(params[:id])
    end

    def calendar_params
      params.require(:event).permit(:title, :date_range, :start_time, :end_time, :color)
    end
end
