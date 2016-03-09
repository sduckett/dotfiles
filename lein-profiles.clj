;;; Some resources for a nice development environment with Leiningen:
;;; http://jakemccrary.com/blog/2015/01/11/overview-of-my-leiningen-profiles-dot-clj/
;;;
;;; Leiningen seems to be using an old version of tools.nrepl, so we put the
;;; most recent version as a dependency so CIDER doesn't fuss at us when we jack-in..
;;;
;;; https://github.com/technomancy/leiningen/issues/1900

{:user {:plugins
        [[lein-bikeshed "0.2.0"]
         [lein-deps-tree "0.1.2"]
         [lein-kibit "0.1.2"]
         [lein-ancient "0.6.7" :exclusions [org.clojure/clojure]]
         [lein-ubersource "0.1.1"]
         [lein-cloverage "1.0.6"]]
        :source-paths ["~/.lein/src"]

        :dependencies [[org.clojure/tools.nrepl "0.2.12"]
                       [org.clojure/tools.namespace "0.2.11"]
                       [spyscope "0.1.5"]
                       [pjstadig/humane-test-output "0.7.1"] ; this broke cider for me....
                       ]

        :injections [(require 'clojure.tools.namespace.repl)
                     (require 'spyscope.core)
                     (require 'pjstadig.humane-test-output) ;this broke cider for me....
                     (pjstadig.humane-test-output/activate!)]

        :aliases {"sanity" ["do"
                            ["clean"]
                            ["with-profile" "production" "deps" ":tree"]
                            ["ancient"] ["kibit"] ["bikeshed"]]
                  "rtfs" ["do"
                          ["clean"]
                          ["ubersource"]
                          ["marg"]]}}}
