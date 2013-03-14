module Kmeans
  class Classifier
    def assignment_step
      # assign data to nearest centroid
      @old_clusters = @clusters
      clusters = new_clusters(@k)
      @data.each_with_index do |d, j|
        min_dist = Float::INFINITY
        nearest = nil
        @means.each_with_index do |m, i|
          next unless m
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

    def run(n = 40)
      n.times do |i|
        break if done?
        puts "Step #{i}"
        update_step
      end
    end

    private
    def done?
      @old_clusters == @clusters
    end
  end
end
