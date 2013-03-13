module Kmeans
  class Classifier
    def assignment_step
      # assign data to nearest centroid
      clusters = new_clusters(@k)
      @data.each do |d|
        min_dist = Float::INFINITY
        nearest = nil
        @means.each_with_index do |m, i|
          dist = distance(d, m)
          if dist < min_dist
            min_dist = dist
            nearest = i
          end
        end
        clusters[nearest] << d
      end
      @clusters = clusters
    end

    def update_step
      means = Array.new(@k)
      # Get centroid of each cluster
      @clusters.each_with_index do |c, i|
        means[i] = centroid(c)
      end
      @means = means
      assignment_step
    end

    def run(n = 100)
      n.times do |i|
        puts "Running step #{i}"
        update_step
      end
    end
  end
end
