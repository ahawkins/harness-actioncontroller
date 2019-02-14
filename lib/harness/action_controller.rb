require 'harness'
require 'harness/action_controller_event_parser'

events = %w(write_fragment read_fragment expire_fragment process_action send_file)

events.each do |name|
  ActiveSupport::Notifications.subscribe "#{name}.action_controller" do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)

    route, action = ::Harness::ActionControllerEventParser.extract_route_action_from_event(event.payload)

    Harness.timing "action_controller.#{name}.#{route}.#{action}", event.duration
  end
end
