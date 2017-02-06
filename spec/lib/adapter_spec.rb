require 'spec_helper'
require 'json'
require 'nokogiri'
require 'pry'

require_relative '../../lib/adapter.rb'

module Newsletter
  describe Content do

    describe "parsing content from JSON" do
      before(:example) do
        @json = File.read File.expand_path(
            "../fixtures/newsletter.json", 
            File.dirname(__FILE__)
        )
        @content = Content.parse(@json, :json)
      end

      it "should parse the json title properly" do
        expect(@content.title).to eq "Hello World"
      end

      it "should parse the json body properly" do
        expect(@content.body).to eq "test content"
      end
    end

    describe "parsing content from XML" do
      before(:example) do
        @xml = File.read File.expand_path(
          "../fixtures/newsletter.xml",
          File.dirname(__FILE__)
        )
        @content = Content.parse(@xml, :xml)
      end

      it "should parse the json title properly" do
        expect(@content.title).to eq "Hello World"
      end

      it "should parse the json body properly" do
        expect(@content.body).to eq "test content"
      end
    end

  end
end
