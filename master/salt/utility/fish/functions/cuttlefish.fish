# Defined in - @ line 1
function cuttlefish --wraps='ssh -p 32085 ssh.sigpanic.com' --description 'alias cuttlefish=ssh -p 32085 ssh.sigpanic.com'
  ssh -p 32085 ssh.sigpanic.com $argv;
end
