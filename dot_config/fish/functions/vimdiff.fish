if command --query nvim
    function vimdiff --wraps nvim
        vim -d $argv
    end
end
