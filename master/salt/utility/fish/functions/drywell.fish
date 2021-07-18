# Defined in - @ line 1
function drywell --wraps='ssh -p 57332 astropeach.com' --description 'alias drywell=ssh -p 57332 astropeach.com'
  ssh -p 57332 astropeach.com $argv;
end
