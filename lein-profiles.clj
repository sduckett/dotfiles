{:user
 {:plugins
  [[jonase/eastwood "0.2.5"]
   [lein-ancient "0.6.15"
    :exclusions [org.clojure/clojure]]
   [lein-bikeshed "0.5.1"]
   [lein-checkall "0.1.1"]
   [lein-cloverage "1.1.2"]
   [lein-deps-tree "0.1.2"]
   [lein-kibit "0.1.5"]
   [com.jakemccrary/lein-test-refresh "0.23.0"]]}
 :repl {:plugins [[cider/cider-nrepl "0.25.2"]
                  [refactor-nrepl "2.5.0"]
                  #_[spyscope "0.1.6"]]
        ;; :injections [(require 'spyscope.core)]
        }}
