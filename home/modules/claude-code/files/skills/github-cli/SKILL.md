---
name: github-cli
description: Use this skill when the user shares a GitHub URL (issue or pull request). Automatically fetch details using GitHub CLI (gh command). Triggered by URLs like github.com/himkt/.claude/issues/123 or github.com/himkt/.claude/pull/123. Do NOT run gh commands directly — always invoke this skill first.
---

# GitHub CLI Skill

Fetch GitHub issue and pull request information using the `gh` command with `--json` for structured output.

## Instructions

When a user provides a GitHub URL:

1. Identify whether it's an issue or pull request from the URL pattern
2. **Determine the repository**: If the user provided a full GitHub URL, parse the owner, repository name, and issue/PR number directly from it. If no URL was provided (e.g., only a PR number), run `gh repo view --json nameWithOwner -q .nameWithOwner` to get the default repository.
3. Fetch structured data using the `--json` flag as shown below
4. For PRs, also fetch review comments and changed files as needed

## Fetching Issue Information

```bash
gh issue view {url} --json title,author,body,state,labels,comments,assignees,createdAt,updatedAt
```

## Fetching Pull Request Information

```bash
gh pr view {url} --json title,author,body,state,labels,comments,reviews,files,additions,deletions,baseRefName,headRefName,reviewDecision,createdAt,updatedAt
```

### Diff content (line-by-line changes)

```bash
gh pr diff {url}
```

Use `gh pr diff` to get the actual diff content. Do NOT use `gh api` for fetching diffs.

### Changed files only

```bash
gh pr diff {url} --name-only
```

### Inline review comments (suggestions)

`gh pr view --json reviews` does not include inline review comments. Use `gh api` to fetch them:

```bash
gh api repos/{owner}/{repo}/pulls/{number}/comments
```

### CI check status

```bash
gh pr checks {url}
```
