function fish_prompt --description 'Write out the prompt'

    set surface_container_highest '#37333e'
    set surface_container_high '#2c2833'
    set on_surface '#e7e0ef'
    set error '#ffb4ab'
    set secondary '#d7bee4'

    if test (echo $status) -ne 0 && test (echo $status) -ne 1
        set color $fish_color_error
    else
        set color $fish_color_command
    end
    echo -n -s (set_color $surface_container_highest)(set_color -b $surface_container_highest)(set_color $secondary) (hostnamectl hostname)(set_color $surface_container_highest)(set_color -b $surface_container_high)(set_color $surface_container_high)" "(set_color -b $surface_container_high)(set_color $on_surface)(date +%R)" "(set_color $surface_container_highest)(set_color -b $surface_container_highest)(set_color $secondary) (prompt_pwd)(set_color -b normal)(set_color $surface_container_highest)(set_color normal)" "
end
