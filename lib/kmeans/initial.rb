module Kmeans
  class Classifier
    def initialize(num_clusters, data)
      @k = num_clusters
      @data = data
      @clusters = new_clusters(@k)
    end

    def clusters
      @clusters
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
