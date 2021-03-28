require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        title: "Title",
        description: "MyText",
        download_url: "Download Url",
        status: "Status"
      ),
      Book.create!(
        title: "Title",
        description: "MyText",
        download_url: "Download Url",
        status: "Status"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Download Url".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
  end
end
