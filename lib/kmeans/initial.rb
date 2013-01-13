module Kmeans
  class Classifier
    def initialize(k, data)
      @k = k
      @data = data
      @clusters = new_clusters(@k)
    end
  end

  module ForgyInitializer
    def initialize(*args)
      super *args
      @means = random_selection(@k)
      assignment_step
    end
  end

  module RandomInitializer
    def initialize(*args)
      super *args
      r = Random.new
      @data.each do |v|
        @clusters[r.rand(@k)] << v
      end
      update_step
    end
  end
end
