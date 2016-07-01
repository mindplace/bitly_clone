require 'rails_helper'

RSpec.describe Url, type: :model do
  describe "validates acceptable links" do
    
  end

  describe "fails unacceptable links" do
    let (:link_one) { "h://something.com" }
    let (:link_two) { "http:// something.com" }
    let (:link_three) { "http://google" }

    it "fails each unacceptable link" do
      [link_one, link_two, link_three].each do |link|
        url = Url.new(body: link)

        p url.valid?
        # all returning true: can't figure out how to use URI.regexp

        expect(url.errors[:body]).not_to be_empty
      end
    end
  end
end
