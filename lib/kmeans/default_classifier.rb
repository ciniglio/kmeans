module Kmeans
  class DefaultClassifier < Classifier
    include RandomInitializer
  end

  class ForgyClassifier < Classifier
    include ForgyInitializer
  end
end
