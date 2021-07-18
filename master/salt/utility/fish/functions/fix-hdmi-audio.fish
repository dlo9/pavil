# Defined via `source`
function fix-hdmi-audio --wraps='amixer -c 0 sset IEC958,1 unmute' --description 'alias fix-hdmi-audio=amixer -c 0 sset IEC958,1 unmute'
  amixer -c 0 sset IEC958,1 unmute $argv; 
end
