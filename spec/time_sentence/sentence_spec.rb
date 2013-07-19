require 'spec_helper'

describe 'Time.to_sentence' do

  it "should accept a positive integer" do
    Time.to_sentence(100000000).should eql "3 years, 5 months, 1 week"
    100000000.to_time_sentence.should eql "3 years, 5 months, 1 week"
  end

  it "should accept a negative integer" do
    Time.to_sentence(-3600).should eql "1 hour ago"
    -3600.to_time_sentence.should eql "1 hour ago"
  end

  it "should accept 0" do
    Time.to_sentence(0).should eql "now"
    0.to_time_sentence.should eql "now"
  end

  it "should accept a very large number" do
    Time.to_sentence(100000000000000000000000).should be_kind_of String
    100000000000000000000000.to_time_sentence.should be_kind_of String
  end

  it "should accept specificity" do
    (1..10).each do |specificity|
      Time.to_sentence(123456789123456789, specificity).should be_kind_of String
      123456789123456789.to_time_sentence(specificity).should be_kind_of String
    end
  end

  it "should ignore a specificity that is out of range" do
      Time.to_sentence(123456789123456789, -5).should be_kind_of String
      123456789123456789.to_time_sentence(-5).should be_kind_of String
      Time.to_sentence(123456789123456789, 20).should be_kind_of String
      123456789123456789.to_time_sentence(20).should be_kind_of String
  end

  require 'active_support/core_ext/numeric'

  it "should round seconds to integers" do
    (1.day + 3.hours + 56.23456454.seconds).to_time_sentence.should eql "1 day, 3 hours, 56 seconds"
  end

end
