module Harness
  class ActionControllerEventParser
    def self.extract_route_action_from_event(payload)
      return controller_event(payload) if payload.key?(:controller)
      return path_event(payload) if payload.key?(:path)
      return key_event(payload) if payload.key?(:key)

      ["NO_ROUTE", "NO_ACTION"]
    end

    def self.controller_event(payload)
      [payload.fetch(:controller), payload.fetch(:action)]
    end

    def self.key_event(payload)
      key = payload.fetch(:key)

      key.split("/")
    end

    def self.path_event(payload)
      path = payload.fetch(:path)

      _, route, action = path.split("/")

      [route, action]
    end
  end
end
