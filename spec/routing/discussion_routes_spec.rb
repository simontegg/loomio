require "spec_helper"

describe "routes to the discussions controller" do
  let(:discussion) { create_discussion }

  #not sure where to put this spec yet
  it 'generates paths using the key & title attributes' do
    d = discussion
    d.title = "This is a tricky óñe & a hard test!"
    path = discussion_path(d)
    path.should == "/d/#{d.key}/#{d.title.parameterize}"
  end

  it "routes correctly for old urls" do
    expect(:get => '/discussions/3' ).
      to route_to(controller: "discussions_redirect", action: "show", id: '3')
  end

  it "routes correctly for new urls" do
    params_key = discussion.key + '/' + discussion.title.parameterize

    expect(:get => discussion_path(discussion)).
      to route_to(controller: "discussions", action: "show", id: params_key)
  end


end
