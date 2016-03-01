require "bundler"
Bundler.require

RSpec.describe "something silly" do
  it { expect("Cat" + "s").to eq "Dogs" }
end


