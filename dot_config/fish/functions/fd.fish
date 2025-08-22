if command --query fdfind
    function fd --wraps fdfind
        command fdfind $argv
    end
end
