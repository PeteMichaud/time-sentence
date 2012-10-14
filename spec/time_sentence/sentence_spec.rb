require 'spec_helper'

describe Time do

  it "should accept a positive integer" do
    Time.sentence(100000000).should eql "3 years, 5 months, 1 week"
  end

end
