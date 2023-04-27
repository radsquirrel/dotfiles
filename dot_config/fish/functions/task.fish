if command --query task
    function task --wraps task
        switch $context
            case work
                command task context work >/dev/null && command task $argv
            case '*'
                command task context home >/dev/null && command task $argv
        end
    end
end
