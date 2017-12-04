require 'rails_helper'

describe OrderItem do
  it { should belong_to :order }
  it { should belong_to :product }
  it { should validate_presence_of :order }
  it { should validate_presence_of :product }
  it { should validate_presence_of :quantity }
end
