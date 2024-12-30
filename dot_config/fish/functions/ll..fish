if command --query eza
    function ll. --wraps eza
        command eza --icons=automatic --group-directories-first --all --long --binary --header --sort newest --ignore-glob "[!.]*" $argv
    end
else
    function ll. --wraps ls
        command ls --color=auto --human-readable --almost-all --sort=time --reverse --format=long --ignore "[^.]*" $argv
    end
end
