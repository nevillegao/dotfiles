require 'irb/completion'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

# Save history between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.rbhistory"
