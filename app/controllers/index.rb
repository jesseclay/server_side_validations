get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
end

post '/events/create' do
  if event = Event.create(:organizer_name => params[:organizer_name],
                           :organizer_email => params[:organizer_email],
                           :title => params[:title],
                           :date => params[:date])
  p event.errors.full_messages
    @event_errors = event.errors.full_messages
    content_type :json
    {errors: @event_errors}.to_json
  end
end
