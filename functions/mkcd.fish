function mkcd
    function display_help
        echo "Usage: mkcd dir-name"
        echo
        echo "Make a new directory and immediately cd into it"
        echo
    end

    if test (count $argv) -eq 0; or test "$argv[1]" = "-h"; or test "$argv[1]" = "--help"
        display_help
        return
    end

    set DIR_NAME $argv[1]
    mkdir -p $DIR_NAME; and cd $DIR_NAME
end

