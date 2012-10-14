require 'spec_helper'

describe 'Time.sentence' do

  it "should accept a positive integer" do
    Time.sentence(100000000).should eql "3 years, 5 months, 1 week"
    100000000.time_sentence.should eql "3 years, 5 months, 1 week"
  end

  it "should accept a negative integer" do
    Time.sentence(-3600).should eql "1 hour ago"
    -3600.time_sentence.should eql "1 hour ago"
  end

  it "should accept 0" do
    Time.sentence(0).should eql "now"
    0.time_sentence.should eql "now"
  end

  it "should accept a very large number" do
    Time.sentence(100000000000000000000000).should be_kind_of String
    100000000000000000000000.time_sentence.should be_kind_of String
  end

  it "should accept specificity" do
    (1..10).each do |specificity|
      Time.sentence(123456789123456789, specificity).should be_kind_of String
      123456789123456789.time_sentence(specificity).should be_kind_of String
    end
  end

  it "should ignore a specificity that is out of range" do
      Time.sentence(123456789123456789, -5).should be_kind_of String
      123456789123456789.time_sentence(-5).should be_kind_of String
      Time.sentence(123456789123456789, 20).should be_kind_of String
      123456789123456789.time_sentence(20).should be_kind_of String
  end

end
