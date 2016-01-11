require 'irb/completion'
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 65535
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.rbhistory"
