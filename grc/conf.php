regexp=\\n
replace=\n
count=more
-
regexp=\\\\
replace=\\
count=more
-
# Highlight time
regexp=^\[([A-Za-z]{3} [A-Za-z]{3} \d{2} \d{2}:\d{2}:\d{2}\.\d{6} \d{4})\]
colour=dark
count=once
-
# Highlight file paths with lines at end
regexp=(/[A-z0-9-]+)+.php:[\d]+
colour=green
count=more
-
# Highlight file paths
regexp=(/[A-z0-9-.]+)+.php
colour=dark green
count=more
-
# Highlight objects
regexp=\(\d+\):
colour=green
count=more
-
# Highlight line numbers
regexp=line:? [\d]+
colour=green
count=once
-
# Highlight objects
regexp= [A-z_@]+->
colour=cyan
count=more
-
# Highlight functions
regexp=[A-z_]+\(\)
colour=yellow
count=more
-
# Highlight functions - misc (stack trace)
regexp=\{main\}\(\)
colour=yellow
count=more
-
# Stack trace
regexp= Stack trace
colour=dark
count=once
-
# Error
regexp=php.:error
colour=on_red
count=stop
-
# Warning
regexp=php.:warn
colour=on_yellow black
count=stop
-
# Notice
regexp=php.:notice
colour=on_yellow black
count=stop
-
# Normal
regexp= PHP
colour=dark
count=stop%