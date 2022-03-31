if command --query exa
    function ls --wraps exa
        command exa $argv
    end
else
    function ls --wraps ls
        command ls --color=auto --human-readable $argv
    end
end
