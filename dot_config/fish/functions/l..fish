if command --query exa
    function l. --wraps exa
        command exa --all --ignore-glob "[!.]*" $argv
    end
else
    function l. --wraps ls
        command ls --color=auto --human-readable --almost-all --ignore "[^.]*" $argv
    end
end
