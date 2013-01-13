require 'set'

module Kmeans
  class Classifier
    def random_selection(n = 1)
      @data.to_a.sample n
    end

    def distance(u, v)
      raise LengthMismatch, "||#{u}|| != ||#{v}||" unless (u.length == v.length)
      sum = 0.to_f
      u.each_with_index do |p, i|
        q = v[i]
        sum += (p - q)**(2.to_f)
      end
      Math.sqrt(sum)
    end

    def new_clusters(n)
      clusters = []
      n.times { clusters << Set.new }
      clusters
    end

    def centroid(points)
      x = Array.new(points.first.length, 0)
      points.each do |p|
        x = x.zip(p).map { |xi| xi.inject(:+) }
      end
      x.map { |xi| xi / points.length.to_f }
    end
  end
end
