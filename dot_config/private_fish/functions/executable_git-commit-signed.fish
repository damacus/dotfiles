# git-commit-signed.fish
# Multi-line signed commit with GPG timeout fallback
#
# Usage:
#   git_commit_signed "feat: add feature" "- Detail 1" "- Detail 2"
#
# Environment variables:
#   GPG_TIMEOUT - Timeout in seconds for GPG signing (default: 10)

function git_commit_signed --description "Create signed commit with GPG timeout fallback"
    set -l gpg_timeout 10
    set -q GPG_TIMEOUT; and set gpg_timeout $GPG_TIMEOUT

    if test (count $argv) -eq 0
        echo "Usage: git_commit_signed <title> [body lines...]"
        echo ""
        echo "Examples:"
        echo "  git_commit_signed 'feat: add feature'"
        echo "  git_commit_signed 'fix: bug fix' '- Fixed issue X' '- Updated Y'"
        echo ""
        echo "Environment:"
        echo "  GPG_TIMEOUT - Timeout in seconds (default: 10)"
        return 1
    end

    # Build commit message from arguments
    set -l title $argv[1]
    set -l body ""

    if test (count $argv) -gt 1
        set body (string join \n $argv[2..-1])
    end

    # Create temp file for commit message
    set -l tmpfile (mktemp)
    echo $title > $tmpfile
    if test -n "$body"
        echo "" >> $tmpfile
        printf "%s\n" $body >> $tmpfile
    end

    # Try signed commit with timeout
    echo "Attempting signed commit (GPG timeout: $gpg_timeout""s)..."

    set -l commit_output
    set -l exit_code

    # Use gtimeout on macOS (from coreutils), timeout on Linux
    set -l timeout_cmd timeout
    if command -q gtimeout
        set timeout_cmd gtimeout
    end

    if $timeout_cmd $gpg_timeout git commit -S -F $tmpfile 2>&1
        echo "✓ Signed commit created successfully"
        rm -f $tmpfile
        return 0
    else
        set exit_code $status

        # Check if it was a timeout (exit code 124) or GPG failure
        if test $exit_code -eq 124
            echo "⚠ GPG signing timed out, falling back to unsigned commit..."
        else if test $exit_code -eq 1
            # Could be "nothing to commit" - check
            if git diff --cached --quiet
                echo "✗ Nothing staged to commit"
                rm -f $tmpfile
                return 1
            end
            echo "⚠ GPG signing failed, falling back to unsigned commit..."
        else
            echo "⚠ GPG signing failed (exit: $exit_code), falling back to unsigned commit..."
        end

        # Fallback to unsigned commit
        if git commit -F $tmpfile
            echo "✓ Unsigned commit created successfully"
            rm -f $tmpfile
            return 0
        else
            echo "✗ Commit failed"
            rm -f $tmpfile
            return 1
        end
    end
end

function git_commit_push_signed --description "Stage all, commit signed, and push"
    if test (count $argv) -eq 0
        echo "Usage: git_commit_push_signed <title> [body lines...]"
        return 1
    end

    # Stage all changes
    git add -A

    # Commit with signing
    if git_commit_signed $argv
        # Push
        echo "Pushing to origin..."
        if git push
            echo "✓ Pushed successfully"
            return 0
        else
            echo "✗ Push failed"
            return 1
        end
    else
        return 1
    end
end
