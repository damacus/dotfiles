function colour_log
    printf '%s---> %s%s\n' (set_color --bold magenta) "$argv" (set_color normal)
end
