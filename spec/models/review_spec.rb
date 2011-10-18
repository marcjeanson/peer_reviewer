require 'spec_helper'

describe Review do
  it { should have_many(:questions).dependent(:destroy) }
end
