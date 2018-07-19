require 'rspec'
require 'LRU_cache'

RSpec.describe LRUCache do
  subject(:LRU) { LRUCache.new(4) }
  
  describe "#initialize" do
    it "receives a cache_size" do
      cache_size = 5
      expect(LRUCache).to receive(cache_size)
      LRUCache.new(cache_size)
    end
  end
  describe "#count" do
    it "starts at zero for a new cache" do
      expect(LRU.count).to eq(0)
    end
    it "returns the current size of the cache"
  end
  describe "#add" do
    context "item already exists in the cache" do
      it "moves item to the end ot the cache"
    end
    context "item is not included in current cache" do
      it "adds the given item to the end of the cache"
    end
    it "never holds more objects than the initialized size"
  end
  describe "#show" do
    it "prints the cache in the proper order"
  end
end
