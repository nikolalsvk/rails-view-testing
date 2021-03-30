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

  context "when there are custom books" do
    before(:each) do
      assign(:books, [
        Book.create!(
          title: "Rails Testing",
          description: "How to test Ruby on Rails applications.",
          download_url: nil,
          status: "draft"
        ),
        Book.create!(
          title: "Rails Patterns",
          description: "A book about patterns and anti-patterns in Ruby on Rails.",
          download_url: "rails-patterns.com/download",
          status: "published"
        )
      ])
    end

    it "renders a list of books with RSpec matchers" do
      render

      expect(rendered).to match(/Rails Testing/)
      expect(rendered).to include("Rails Patterns")

      expect(rendered).to match(/How to test Ruby on Rails applications./)
      expect(rendered).to include("A book about patterns and anti-patterns in Ruby on Rails.")

      expect(rendered).to include("rails-patterns.com/download")

      expect(rendered).to include("published")
    end

    it "renders a list of books with Capybara matchers" do
      render

      expect(rendered).to have_selector("tr>td", text: "Rails Testing")
      expect(rendered).to have_selector("tr>td", text: "Rails Patterns")

      expect(rendered).to have_selector("tr>td", text: "How to test Ruby on Rails applications")
      expect(rendered).to have_selector("tr>td", text: "A book about patterns and anti-patterns in Ruby on Rails.")

      expect(rendered).to have_selector("tr>td", text: "rails-patterns.com/download")

      expect(rendered).to have_selector("tr>td", text: "published")
    end
  end
end
