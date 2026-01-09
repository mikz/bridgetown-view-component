# frozen_string_literal: true

require "spec_helper"

describe "bridgetown-view-component (integration)" do
  include_context "bridgetown built site"

  it "renders a ViewComponent with slots from a page" do
    contents = read_output("index.html")
    expect(contents).to include("Greetings Bridgetown")
    expect(contents).to include("<hr>\n")
    expect(contents).to include("<strong>Post 1</strong> <span>-&gt;</span>")
    expect(contents).to include("<strong>Post 2</strong> <span>-&gt;</span>")
  end

  it "renders nested ViewComponents" do
    contents = read_output("nested.html")
    expect(contents).to include("Nested List:")
    expect(contents).to include("Nested Item: One")
    expect(contents).to include("Nested Item: Two")
  end

  it "exposes Bridgetown helpers inside ViewComponent templates" do
    contents = read_output("helpers-access.html")
    expect(contents).to include('class="primary"')
    expect(contents).to include("<strong>From Bridgetown helper</strong>")
  end

  it "supports allow_rails_helpers :tag (ActionView TagHelper)" do
    contents = read_output("header-component.html")
    expect(contents).to include("<h1")
    expect(contents).to include("my-8 text-3xl font-bold tracking-tight text-primary-white sm:text-4xl")
  end

  it "supports returning a html_safe string from call" do
    contents = read_output("safe-call.html")
    expect(contents).to include("<strong>Safe Call</strong>")
  end
end
