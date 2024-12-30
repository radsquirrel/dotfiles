if command --query eza
    function ls --wraps eza
        command eza --icons=automatic --group-directories-first $argv
    end
else
    function ls --wraps ls
        command ls --color=auto --human-readable $argv
    end
end
