if command --query batcat
    function bat --wraps batcat
        command batcat $argv
    end
end
