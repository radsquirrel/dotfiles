function _navi_copy
    if command --query navi
        command navi --print | yank
        commandline -f repaint
    end
end
