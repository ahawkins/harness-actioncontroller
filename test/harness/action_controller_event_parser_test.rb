require "test_helper"

class ::Harness::ActionControllerEventParserTest < MiniTest::Test
  def test_that_full_payload_returns_route_and_action
    payload = {
        :controller => "PostsController",
        :action => "new",
        :params => { "action" => "new", "controller" => "posts" },
        :format => :html,
        :method => "GET",
        :path => "/posts/new",
      }

      assert_equal(["PostsController","new"], ::Harness::ActionControllerEventParser.extract_route_action_from_event(payload))
  end

  def test_that_path_payload_returns_route_and_action
    payload = {
      :path => "/users/1"
    }

    assert_equal(["users","1"], ::Harness::ActionControllerEventParser.extract_route_action_from_event(payload))
  end

  def test_that_key_payload_returns_route_and_action
    payload = {
      :key => "posts/1-dashboard-view"
    }

    assert_equal(["posts","1-dashboard-view"], ::Harness::ActionControllerEventParser.extract_route_action_from_event(payload))
  end
end
