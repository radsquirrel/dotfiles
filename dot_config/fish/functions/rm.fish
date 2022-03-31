function rm --wraps rm
    command rm -I --verbose --preserve-root --one-file-system $argv
end
