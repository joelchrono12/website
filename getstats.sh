#!/usr/bin/env bash
dirBuild="/home/chrono/Documents/git/joelchrono12.ml/_site"
dirPosts="/home/chrono/Documents/git/joelchrono12.ml/_posts"
dirDrafts="/home/chrono/Documents/git/joelchrono12.ml/_drafts"
#100 Days to Offload start date, value formatted as YYYYMMDD
startDate=20260722
endDate="$(date -d "$startDate+1 year" "+%Y%m%d")"

prepare() {
    validateConfig
    getStats
}
validateConfig() {
    if [[ -z "$dirBuild" ]]
    then
        quit "The configuration setting \"dirBuild\" is not defined."
    fi
    if [[ -z "$dirPosts" ]]
    then
        quit "The configuration setting \"dirPosts\" is not defined."
    fi
    if [ -z "$dirDrafts" ]
    then
        quit "The configuration setting \"dirDrafts\" is not defined."
    fi
    if [ -z "$startDate" ]
    then
        quit "The configuration setting \"startDate\" is not defined."
    fi
    if [ ! -d "$dirBuild" ]
    then
        quit "The directory '$dirBuild' was not found or permission was denied. The operation has been halted."
    fi
    if [ ! -d "$dirPosts" ]
    then
        quit "The directory '$dirPosts' was not found or permission was denied. The operation has been halted."
    fi
    if [ ! -d "$dirDrafts" ]
    then
        quit "The directory '$dirDrafts' was not found or permission was denied. The operation has been halted."
    fi
}
getStats() {
    getPostCount
    getDraftCount
    getDiskUsage
}
getPostCount() {
    postCount=0
    postCountChallenge=0
    for post in "$dirPosts"/*.md;
    do
        [[ -e "$post" ]] || continue

        postContents="$(cat "$post")"
        post="${post##*/}"
        post="${post:0:4}${post:5:2}${post:8:2}"
        #if [[ "$postContents" =~ .*\-\ 100DaysToOffload.* ]] && [ "$post" -ge "$startDate" ] && [ "$post" -le "$endDate" ]
        if [ "$post" -ge "$startDate" ] && [ "$post" -le "$endDate" ]
        then
                ((postCountChallenge++))
        else
            ((postCount++))
        fi
    done
    postCount="$((postCount+postCountChallenge))"
}
getDraftCount() {
    draftCount=0
    for drafts in "$dirDrafts"/*.md;
    do
        [[ -e "$drafts" ]] || continue
        draft="${drafts:10}"
        if [ "${draft:1:4}" != 'tpl-' ] && [ "${draft:1}" != 'reminders.md' ]
        then
            ((draftCount++))
        fi
    done
}
getDiskUsage(){
    diskUsage="$(du -hs $dirBuild | cut -f1)"
}
displayStats() {
        printf "\n%b\n" "\033[1m100 Days to Offload Stats\033[0m"
        printf "\t%s %s\n" "Start Date:" "$(date -d "$startDate" "+%B %d, %Y")"
        printf "\t%s %s\n" "End Date:" "$(date -d "$endDate" "+%B %d, %Y")"
        printf "\t%s\n" "Total Posts: $postCountChallenge"
        printf "\t%s\n" "Total Remaining Posts: $((100-postCountChallenge))"
        printf "\n%b\n" "\033[1mGeneral Stats\033[0m"
        printf "\t%s\n" "Total Posts: $postCount"
        printf "\t%s\n" "Total Post Drafts: $draftCount"
        printf "\t%s\n\n" "Total Disk Usage: $diskUsage"
}
quit() {
    if [[ "$1" = 0 ]]
    then
            exit 0
    else
            printf "%b\n" "\033[1mError:\033[0m $1"
            exit 1
    fi
}

prepare
displayStats
