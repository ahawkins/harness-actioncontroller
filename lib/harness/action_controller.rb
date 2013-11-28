require 'harness'

events = %w(write_fragment read_fragment expire_fragment process_action send_file)

events.each do |name|
  ActiveSupport::Notifications.subscribe "#{name}.action_controller" do |*args|
    event = ActiveSupport::Notifications::Event.new(*args)

    controller, action = event.payload.fetch(:controller), event.payload.fetch(:action)

    Harness.timing "action_controller.#{name}.#{controller}.#{action}", event.duration
  end
end
