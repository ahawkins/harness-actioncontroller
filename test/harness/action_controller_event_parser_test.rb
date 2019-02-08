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

  def test_that_key_payload_returns_route_and_action

  end

  def test_that_path_payload_returns_route_and_action

  end
end

# describe ::Harness::ActionControllerEventParser do
#   describe "Full payload" do
#     let(:payload) {
#       {
#         :controller => "PostsController",
#         :action => "new",
#         :params => { "action" => "new", "controller" => "posts" },
#         :format => :html,
#         :method => "GET",
#         :path => "/posts/new",
#       }
#     }
#
#     it "returns correct route/action" do
#     end
#   end
#
#   describe "Path payload only" do
#     let(:payload) {
#       {
#         :path => "/users/1"
#       }
#     }
#
#     it "returns correct route/action" do
#       expect(::Harness::ActionControllerEventParser.extract_route_action_from_event(payload)).to eq(["users", "1"])
#     end
#   end
#
#   describe "Key payload" do
#     let(:payload) {
#       {
#         :key => "posts/1-dashboard-view"
#       }
#     }
#
#     it "returns correct route/action" do
#       expect(::Harness::ActionControllerEventParser.extract_route_action_from_event(payload)).to eq(["posts", "1-dashboard-view"])
#     end
#   end
#
#   describe "Empty/Invalid payload" do
#     let(:payload) { {} }
#
#     it "returns correct route/action" do
#       expect(::Harness::ActionControllerEventParser.extract_route_action_from_event(payload)).to eq(["NO_ROUTE", "NO_ACTION"])
#     end
#   end
# end
