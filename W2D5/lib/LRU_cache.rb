class LRUCache

  def initialize(cache_size)
    @cache_size = cache_size
    @cache = []
  end

  def count
    cache.length
  end

  def add(el)
    idx = cache.index(el)
    if idx
      cache = cache.take(idx) + cache.drop(idx + 1) + el
    else
      cache += el
    end
    until count <= cache_size
      cache.shift
    end
  end

  def show
    print cache
  end

  private

  attr_acecessor :cache, :cache_size

end
