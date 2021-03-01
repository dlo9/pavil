# use the fish_key_reader command to print keycodes you with to use.
# These are often terminal-dependent
function fish_user_key_bindings
	# Ctrl-Backspace
	bind \e\[3^ kill-word
	# Ctrl-Delete
	bind \b backward-kill-word
	# Delete 'Ctrl-D to exit' binding, which causes accidental terminal exit
	# when ssh'd pagers hit EOF
	# https://stackoverflow.com/questions/34216850/how-to-prevent-iterm2-from-closing-when-typing-ctrl-d-eof
	# In bash, use:
	# https://unix.stackexchange.com/questions/139115/disable-ctrl-d-window-close-in-terminator-terminal-emulator
	bind --erase --preset \cd
end
