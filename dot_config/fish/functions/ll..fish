if command --query exa
    function ll. --wraps exa
        command exa --all --long --binary --header --sort newest --ignore-glob "[!.]*" $argv
    end
else
    function ll. --wraps ls
        command ls --color=auto --human-readable --almost-all --sort=time --reverse --format=long --ignore "[^.]*" $argv
    end
end
