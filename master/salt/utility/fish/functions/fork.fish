# Redirect output to /dev/null to prevent "disown: There are no suitable jobs"
# message on trivial commands (e.g., fork echo "Hello World!")

function fork 
	eval "$argv & disown > /dev/null"
end
