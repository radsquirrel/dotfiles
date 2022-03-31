function chown --wraps chown
    command chown --changes --preserve-root $argv
end
