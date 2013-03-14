require 'set'
require 'matrix'

module Kmeans
  class Classifier
    def random_selection(n = 1)
      @data.to_a.sample n
    end

    def new_clusters(n)
      clusters = []
      n.times { clusters << Set.new }
      clusters
    end

    def distance(u,v)
      Kmeans::distance(u,v)
    end

    def centroid(p)
      Kmeans::centroid(p)
    end
  end

  def self.distance(u, v)
    raise LengthMismatch, "||#{u}|| != ||#{v}||" unless (u.length == v.length)
    sum = 0.to_f
    sum = u.zip(v).map{ |i| i.inject(:-)**2 }.sum
    Math.sqrt(sum)
  end

  def self.centroid(points)
    return nil unless points.length > 0
    z = Array.new(points.first.length, 0.0)
    z.zip(*points).map{|i| i.inject(:+)/z.count}
  end
end
