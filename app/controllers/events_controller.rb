class EventsController < ApplicationController

def new
  @event = Event.new
end

def create
  @event = current_user.events.create(event_params)
  @event.user_id = current_user.id
  if @event.save
    if params[:event][:attendees].present?
    id = params[:event][:attendees].keys
    new = User.find_by(email: id)
      Attendee.create(user_id: new.id , event_id: @event.id)
    end
  redirect_to dashboard_path
end
binding.pry
end

private
def event_params
  params.require(:event).permit(:title, :runtime, :date, :time)
end
end
