{:user {:plugins [[lein-ancient "0.6.2"]
                  [lein-vanity "0.1.0"]
                  [lein-kibit "0.0.8"]
                  [lein-pprint "1.1.2"]
                  [cider/cider-nrepl "0.9.0-SNAPSHOT"]
                  [refactor-nrepl "1.1.0"]]

        :test-refresh {:notify-command ["terminal-notifier" "-title" "\"test-refresh\"" "-message"]
                       :notify-on-success true
                       :quiet true}

        :dependencies [[slamhound "1.5.0"]]

        :aliases      {"slamhound" ["run" "-m" "slam.hound"]}}}
