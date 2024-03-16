function tar --wraps strace
    command strace -s 128 -T -tt -y -Y -f $argv
end
