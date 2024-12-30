if command --query eza
    function ll --wraps eza
        command eza --icons=automatic --group-directories-first --long --binary --header --sort newest $argv
    end
else
    function ll --wraps ls
        command ls --format=long --color=auto --human-readable --sort=time --reverse $argv
    end
end
