function cp --wraps cp
    command cp --interactive --verbose --reflink=auto --sparse=always $argv
end
