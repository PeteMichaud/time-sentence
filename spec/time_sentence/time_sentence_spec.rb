require 'spec_helper'

describe Numeric do

  it "should accept a positive integer" do
    100000000.time_sentence.should eql "3 years, 5 months, 1 week"
  end

end
