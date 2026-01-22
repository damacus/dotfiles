# Global Rules

## TDD (REQUIRED)

Every production code line must be driven by a failing test. Red-Green-Refactor cycle. Test public APIs only. Never weaken types to satisfy interpreter.

## Commits

Use Conventional Commits: `feat:`, `fix:`, `refactor:`, `test:`

**Signed multi-line commits (preferred):**

```fish
git_commit_signed "feat: add feature" "- Detail 1" "- Detail 2"
git_commit_push_signed "fix: bug" "- Fixed X"  # stages, commits, pushes
```

GPG signing with 10s timeout, auto-fallback to unsigned if GPG fails.

## Shell

- **Fish shell only**
- **NEVER use multiline shell strings** - causes hangs
- Use `run_command` tool, NOT `cd` commands

## Code Standards

- Guard clauses for early returns
- Strong typing always (no `Any`, no `T.untyped`)
- Small atomic changes
- All tests/checks pass before merge

## Tooling

| Tool     | Command                   |
|----------|---------------------------|
| Docker   | `docker compose`          |
| Tasks    | `task` (not bare scripts) |
| Markdown | `markdown-lint-cli2`      |
| Tests    | `playwright`              |

## AI Behavior

- Small, focused changes per iteration
- Verify before proceeding
- Follow TDD strictly
- No monolithic updates
