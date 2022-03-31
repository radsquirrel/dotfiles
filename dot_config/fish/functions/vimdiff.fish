if command --query nvim
    function vimdiff --wraps nvim
        command nvim -d $argv
    end
end
