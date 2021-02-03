(require 'profiler)
(profiler-start 'cpu+mem)
(run-with-idle-timer 2 nil 'profiler-report)

