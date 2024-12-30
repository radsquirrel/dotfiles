if command --query eza
    function l. --wraps eza
        command eza --all --ignore-glob "[!.]*" $argv
    end
else
    function l. --wraps ls
        command ls --color=auto --human-readable --almost-all --ignore "[^.]*" $argv
    end
end
