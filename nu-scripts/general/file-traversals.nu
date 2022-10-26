export def find_extension [extension: string] {
    ^find . | split row (char newline) | where ($it | str ends-with ".${extension}")
}