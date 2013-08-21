require 'spec_helper'

describe Kanperiscope::Core do
  describe '#test' do
      subject {described_class.new.test}
      it{should == true}

  end
end