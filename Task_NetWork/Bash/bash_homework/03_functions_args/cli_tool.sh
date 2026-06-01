#!/bin/bash
# هدف: پردازش آرگومان‌ها با getopts (-f FILE, -u USER, -h help)

print_help() {
    echo "Usage: $0 [-f FILE] [-u USER] [-h]"
    echo "  -f FILE   Count lines in the given file"
    echo "  -u USER   Print a welcome message for USER"
    echo "  -h        Show this help message"
}

# حداقل یک آرگومان لازم است
if [ $# -eq 0 ]; then
    print_help
    exit 1
fi

while getopts "f:u:h" opt; do
    case "$opt" in
        f)
            # اعتبارسنجی وجود فایل
            if [ ! -f "$OPTARG" ]; then
                echo "ERROR: File '$OPTARG' not found."
                exit 1
            fi
            lines=$(wc -l < "$OPTARG")
            echo "File: $OPTARG  |  Lines: $lines"
            ;;
        u)
            echo "Welcome, $OPTARG! Glad to have you here."
            ;;
        h)
            print_help
            ;;
        *)
            echo "Unknown option. Use -h for help."
            exit 1
            ;;
    esac
done
