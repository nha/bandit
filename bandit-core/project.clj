(defproject clj-bandit/bandit-core "0.2.0-SNAPSHOT"
  :description "Multi-armed bandit algorithms"
  :url "http://github.com/pingles/clj-bandit"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.4.0"]
                 [org.clojure/math.numeric-tower "0.0.1"]]
  :profiles {:dev {:dependencies [[criterium "0.3.0"]
                                  [org.clojure/data.csv "0.1.2"]]}})