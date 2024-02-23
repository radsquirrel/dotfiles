if command --query exa
    function ll --wraps exa
        command exa --long --binary --header --sort newest $argv
    end
else
    function ll --wraps ls
        command ls --format=long --color=auto --human-readable --sort=time --reverse $argv
    end
end
