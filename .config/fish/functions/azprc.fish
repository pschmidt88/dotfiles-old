function azprc
    set -l desc ""
    set -l git_pr_template (git rev-parse --show-toplevel)/.azuredevops/pull_request_template.md
    set -l commits_in_branch (git log (git_main_branch)..(git_current_branch) --oneline)
    set -l first_commit_message (echo "$commits_in_branch" | tail -1 | sed 's/[^ ]* //')
    set -l extra_args ()

    if test (count (echo "$commits_in_branch" | string split "\n")) -ge 2
        set extra_args "--title" "$first_commit_message"
    end

    if test -f "$git_pr_template"
        set desc (cat "$git_pr_template" | string collect)
    end

    az repos pr create $extra_args \
    --description "$desc" \
    $argv > /dev/null
end
