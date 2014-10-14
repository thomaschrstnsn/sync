{:user {:plugins [[lein-ancient "0.5.4"]
                  [lein-vanity "0.1.0"]
                  [lein-kibit "0.0.8"]
                  [lein-pprint "1.1.2"]
                  [com.jakemccrary/lein-test-refresh "0.5.4"]
                  [cider/cider-nrepl "0.7.0"]]

        :test-refresh {:notify-command ["terminal-notifier" "-title" "\"test-refresh\"" "-message"]
                       :notify-on-success true}

        :dependencies [[slamhound "1.5.0"]]

        :aliases      {"slamhound" ["run" "-m" "slam.hound"]}}}
