;;; Some resources for a nice development environment with Leiningen:
;;; http://jakemccrary.com/blog/2015/01/11/overview-of-my-leiningen-profiles-dot-clj/
;;;
;;; Leiningen seems to be using an old version of tools.nrepl, so we put the
;;; most recent version as a dependency so CIDER doesn't fuss at us when we jack-in..
;;;
;;; https://github.com/technomancy/leiningen/issues/1900

{:user {:plugins
        [[org.clojure/tools.nrepl "0.2.10"] ;; https://github.com/clojure/tools.nrepl
         [chestnut/lein-template "0.8.1"]   ;; https://github.com/plexus/chestnut
         [lein-midje "3.1.3"]               ;; https://github.com/marick/lein-midje
         [cider/cider-nrepl "0.9.1"]        ;; https://github.com/clojure-emacs/cider-nrepl
         [refactor-nrepl "1.1.0"]           ;; https://github.com/clojure-emacs/refactor-nrepl
         [lein-bikeshed "0.2.0"]            ;; https://github.com/dakrone/lein-bikeshed
         [lein-deps-tree "0.1.2"]           ;; https://github.com/the-kenny/lein-deps-tree
         [lein-marginalia "0.8.0"]          ;; https://github.com/gdeer81/lein-marginalia
         [lein-kibit "0.1.2"]               ;; https://github.com/jonase/kibit
         [lein-ancient "0.6.7"]             ;; https://github.com/xsc/lein-ancient
         [lein-cloverage "1.0.6"]           ;; https://github.com/lshift/cloverage
         [lein-ubersource "0.1.1"]]         ;; https://github.com/puppetlabs/lein-ubersource

        :dependencies [[org.clojure/tools.nrepl "0.2.10"]
                       [pjstadig/humane-test-output "0.7.0"]]

        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]

        :aliases {"sanity-check" ["do"
                                  ["clean"]
                                  ["with-profile" "production" "deps" ":tree"] ["ancient"] ["kibit"] ["bikeshed"]]}
        }
 }
