function git_main_branch
    command git rev-parse --git-dir > /dev/null; or return
    for ref in refs/heads/main refs/heads/trunk refs/heads/mainline refs/heads/default refs/remotes/origin/main refs/remotes/origin/trunk refs/remotes/origin/mainline refs/remotes/origin/default refs/remotes/upstream/main refs/remotes/upstream/trunk refs/remotes/upstream/mainline refs/remotes/upstream/default
        if command git show-ref -q --verify $ref
            echo (basename $ref)
            return
        end
    end
    echo master
end
