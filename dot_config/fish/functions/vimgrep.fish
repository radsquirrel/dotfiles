if command --query rg
    function vimgrep
        vim -q (command rg --vimgrep --no-heading --smart-case $argv | psub)
    end
end
