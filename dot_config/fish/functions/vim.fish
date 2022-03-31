if command --query nvim
    function vim --wraps nvim
        command nvim $argv
    end
else
    function vim --wraps vim
        command vim $argv
    end
end
