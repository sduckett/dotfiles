{:user {:plugins
        [[lein-bikeshed "0.2.0"]
         #_[cider/cider-nrepl "0.14.0"]
         [refactor-nrepl "2.2.0"]
         [lein-deps-tree "0.1.2"]
         [lein-kibit "0.1.2"]
         [lein-try "0.4.3"]
         [lein-ancient "0.6.10" :exclusions [org.clojure/clojure]]
         [lein-ubersource "0.1.1"]
         [lein-cloverage "1.0.6"]
         [lein-marginalia "0.9.0"]]
        :source-paths ["~/.lein/src"]

        :dependencies [[org.clojure/tools.nrepl "0.2.12"]
                       [org.clojure/tools.namespace "0.2.11"]]

        :injections [(require 'clojure.tools.namespace.repl)]

        :aliases {"sanity" ["do"
                            ["clean"]
                            ["with-profile" "production" "deps" ":tree"]
                            ["ancient"] ["kibit"] ["bikeshed"]]
                  "rtfs" ["do"
                          ["clean"]
                          ["ubersource"]
                          ["marg"]]}}}
