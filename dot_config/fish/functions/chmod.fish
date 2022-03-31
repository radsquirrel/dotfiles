function chmod --wraps chmod
    command chmod --changes --preserve-root $argv
end
