# Defined in - @ line 1
function cuttlefish --wraps='ssh -p 32085 sigpanic.com' --description 'alias cuttlefish=ssh -p 32085 sigpanic.com'
  ssh -p 32085 sigpanic.com $argv;
end
