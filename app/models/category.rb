class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Paranoia

  include CommonMeta
  after_save :clear_cache

  def clear_cache
    $redis.del "categories"
  end

  def self.columns
    self.fields.collect{|c| c[1]}
  end
end
