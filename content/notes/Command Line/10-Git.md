---
title: 10. Git
date: 2019-11-08
weight: 10
---

- commitizen
- cz-conventional-changlog
- conventional-changelog-cli
- standard-version

## Github

- hub

## commit message

Angular Git Commit Guidelines

```txt
<type>(<scope>): <subject>
<br>
<body>
<br>
<footer>
```

### commitizen

使用 commitizen 规范信息，需要 nodejs

```c
#include <bits/stdc++.h>
using namespace std;

int n = 0, q = 0;
string s;

vector<int> d[4];
int nex[100005][26] = {};
int dp[255][255][255] = {};

void prepare() {
  memset(dp, -1, sizeof(dp));
  for (int c = 0; c < 26; ++c) {
    nex[n][c] = nex[n + 1][c] = n;
  }
  for (int i = n - 1; i >= 0; --i) {
    for (int c = 0; c < 26; ++c) {
      nex[i][c] = nex[i + 1][c];
    }
    nex[i][s[i] - 'a'] = i;
  }
}
```

```sh
yarn global add commitizen
npm init --yes
ln -s /Users/username/node_modules ./node_modules
commitizen init cz-conventional-changelog --save --save-exact
git cz
```

<!--more-->

配置后只需

```
ln -s /Users/username/node_modules ./node_modules
git cz
```

## Github

- push: `git push -u origin my_branch:remote_branch`
- Pull Request
- gitignore

## Git command line

### Git

- `g` is short for `git`.

### Branch

- `gb` lists, creates, renames, and deletes branches.
- `gbc` creates a new branch.
- `gbl` lists branches and their commits. (also `gbv`)
- `gbL` lists all local and remote branches and their commits.
- `gbr` renames a branch. (also `gbm`)
- `gbR` renames a branch even if the new branch name already exists. (also
  `gbM`)
- `gbs` lists branches and their commits with ancestry graphs.
- `gbS` lists local and remote branches and their commits with ancestry
  graphs.
- `gbV` lists branches with more verbose information about their commits.
- `gbx` deletes a branch. (also `gbd`)
- `gbX` deletes a branch irrespective of its merged status. (also `gbD`)

### Commit

- `gc` records changes to the repository.
- `gca` stages all modified and deleted files.
- `gcm` records changes to the repository with the given message.
- `gcS` records changes to the repository. (Signed)
- `gcSa` stages all modified and deleted files. (Signed)
- `gcSm` records changes to the repository with the given message. (Signed)
- `gcam` stages all modified and deleted files, and records changes to the repository with the given message.
- `gco` checks out a branch or paths to work tree.
- `gcO` checks out hunks from the index or the tree interactively.
- `gcf` amends the tip of the current branch using the same log message as _HEAD_.
- `gcSf` amends the tip of the current branch using the same log message as _HEAD_. (Signed)
- `gcF` amends the tip of the current branch.
- `gcSF` amends the tip of the current branch. (Signed)
- `gcp` applies changes introduced by existing commits.
- `gcP` applies changes introduced by existing commits without committing.
- `gcr` reverts existing commits by reverting patches and recording new
  commits.
- `gcR` removes the _HEAD_ commit.
- `gcs` displays various types of objects.
- `gcsS` displays commits with GPG signature.
- `gcl` lists lost commits.
- `gcy` displays commits yet to be applied to upstream in the short format.
- `gcY` displays commits yet to be applied to upstream.

### Conflict

- `gCl` lists unmerged files.
- `gCa` adds unmerged file contents to the index.
- `gCe` executes merge-tool on all unmerged file.
- `gCo` checks out our changes for unmerged paths.
- `gCO` checks out our changes for all unmerged paths.
- `gCt` checks out their changes for unmerged paths.
- `gCT` checks out their changes for all unmerged paths.

### Data

- `gd` displays information about files in the index and the work tree.
- `gdc` lists cached files.
- `gdx` lists deleted files.
- `gdm` lists modified files.
- `gdu` lists untracked files.
- `gdk` lists killed files.
- `gdi` lists ignored files.

### Fetch

- `gf` downloads objects and references from another repository.
- `gfa` downloads objects and references from all remote repositories.
- `gfc` clones a repository into a new directory.
- `gfcr` clones a repository into a new directory including all submodules.
- `gfm` fetches from and merges with another repository or local branch.
- `gfr` fetches from and rebases on another repository or local branch.

### Flow

- `gFi` is short for `git flow init`

#### Feature

- `gFf` is short for `git flow feature`
- `gFfl` is short for `git flow feature list`
- `gFfs` is short for `git flow feature start`
- `gFff` is short for `git flow feature finish`
- `gFfp` is short for `git flow feature publish`
- `gFft` is short for `git flow feature track`
- `gFfd` is short for `git flow feature diff`
- `gFfr` is short for `git flow feature rebase`
- `gFfc` is short for `git flow feature checkout`
- `gFfm` is short for `git flow feature pull`
- `gFfx` is short for `git flow feature delete`

#### Bugfix

- `gFb` is short for `git flow bugfix`
- `gFbl` is short for `git flow bugfix list`
- `gFbs` is short for `git flow bugfix start`
- `gFbf` is short for `git flow bugfix finish`
- `gFbp` is short for `git flow bugfix publish`
- `gFbt` is short for `git flow bugfix track`
- `gFbd` is short for `git flow bugfix diff`
- `gFbr` is short for `git flow bugfix rebase`
- `gFbc` is short for `git flow bugfix checkout`
- `gFbm` is short for `git flow bugfix pull`
- `gFbx` is short for `git flow bugfix delete`

#### Release

- `gFl` is short for `git flow release`
- `gFll` is short for `git flow release list`
- `gFls` is short for `git flow release start`
- `gFlf` is short for `git flow release finish`
- `gFlp` is short for `git flow release publish`
- `gFlt` is short for `git flow release track`
- `gFld` is short for `git flow release diff`
- `gFlr` is short for `git flow release rebase`
- `gFlc` is short for `git flow release checkout`
- `gFlm` is short for `git flow release pull`
- `gFlx` is short for `git flow release delete`

#### Hotfix

- `gFh` is short for `git flow hotfix`
- `gFhl` is short for `git flow hotfix list`
- `gFhs` is short for `git flow hotfix start`
- `gFhf` is short for `git flow hotfix finish`
- `gFhp` is short for `git flow hotfix publish`
- `gFht` is short for `git flow hotfix track`
- `gFhd` is short for `git flow hotfix diff`
- `gFhr` is short for `git flow hotfix rebase`
- `gFhc` is short for `git flow hotfix checkout`
- `gFhm` is short for `git flow hotfix pull`
- `gFhx` is short for `git flow hotfix delete`

#### Support

- `gFs` is short for `git flow support`
- `gFsl` is short for `git flow support list`
- `gFss` is short for `git flow support start`
- `gFsf` is short for `git flow support finish`
- `gFsp` is short for `git flow support publish`
- `gFst` is short for `git flow support track`
- `gFsd` is short for `git flow support diff`
- `gFsr` is short for `git flow support rebase`
- `gFsc` is short for `git flow support checkout`
- `gFsm` is short for `git flow support pull`
- `gFsx` is short for `git flow support delete`

### Grep

- `gg` displays lines matching a pattern.
- `ggi` displays lines matching a pattern ignoring case.
- `ggl` lists files matching a pattern.
- `ggL` lists files that are not matching a pattern.
- `ggv` displays lines not matching a pattern.
- `ggw` displays lines matching a pattern at word boundary.

### Index

- `gia` adds file contents to the index.
- `giA` adds file contents to the index interactively.
- `giu` adds file contents to the index (updates only known files).
- `gid` displays changes between the index and a named commit (diff).
- `giD` displays changes between the index and a named commit (word diff).
- `gii` temporarily ignore differences in a given file.
- `giI` unignore differences in a given file.
- `gir` resets the current HEAD to the specified state.
- `giR` resets the current index interactively.
- `gix` removes files/directories from the index (recursively).
- `giX` removes files/directories from the index (recursively and forced).

### Log

- `gl` displays the log.
- `gls` displays the stats log.
- `gld` displays the diff log.
- `glo` displays the one line log.
- `glg` displays the graph log.
- `glb` displays the brief commit log.
- `glc` displays the commit count for each contributor in descending order.
- `glS` displays the log and checks the validity of signed commits.

### Merge

- `gm` joins two or more development histories together.
- `gmC` joins two or more development histories together but does not commit.
- `gmF` joins two or more development histories together but does not commit
  generating a merge commit even if the merge resolved as a fast-forward.
- `gma` aborts the conflict resolution, and reconstructs the pre-merge state.
- `gmt` runs the merge conflict resolution tools to resolve conflicts.

### Push

- `gp` updates remote refs along with associated objects.
- `gpf` forcefully updates remote refs along with associated objects using the safer `--force-with-lease` option.
- `gpF` forcefully updates remote refs along with associated objects using the riskier `--force` option.
- `gpa` updates remote branches along with associated objects.
- `gpA` updates remote branches and tags along with associated objects.
- `gpt` updates remote tags along with associated objects.
- `gpc` updates remote refs along with associated objects and adds _origin_
  as an upstream reference for the current branch.
- `gpp` pulls and pushes from origin to origin.

### Rebase

- `gr` forward-ports local commits to the updated upstream head.
- `gra` aborts the rebase.
- `grc` continues the rebase after merge conflicts are resolved.
- `gri` makes a list of commits to be rebased and opens the editor.
- `grs` skips the current patch.

### Remote

- `gR` manages tracked repositories.
- `gRl` lists remote names and their URLs.
- `gRa` adds a new remote.
- `gRx` removes a remote.
- `gRm` renames a remote.
- `gRu` fetches remotes updates.
- `gRp` prunes all stale remote tracking branches.
- `gRs` displays information about a given remote.
- `gRb` opens a remote on [GitHub][3] in the default browser.

### Stash

- `gs` stashes the changes of the dirty working directory.
- `gsa` applies the changes recorded in a stash to the working directory.
- `gsx` drops a stashed state.
- `gsX` drops all the stashed states.
- `gsl` lists stashed states.
- `gsL` lists dropped stashed states.
- `gsd` displays changes between the stash and its original parent.
- `gsp` removes and applies a single stashed state from the stash list.
- `gsr` recovers a given stashed state.
- `gss` stashes the changes of the dirty working directory, including untracked.
- `gsS` stashes the changes of the dirty working directory interactively.
- `gsw` stashes the changes of the dirty working directory retaining the index.

### Submodule

- `gS` initializes, updates, or inspects submodules.
- `gSa` adds given a repository as a submodule.
- `gSf` evaluates a shell command in each of checked out submodules.
- `gSi` initializes submodules.
- `gSI` initializes and clones submodules recursively.
- `gSl` lists the commits of all submodules.
- `gSm` moves a submodule.
- `gSs` synchronizes submodules' remote URL to the value specified in
  .gitmodules.
- `gSu` fetches and merges the latest changes for all submodule.
- `gSx` removes a submodule.

### Tag

- `gt` lists tags or creates tag.
- `gtl` lists tags matching pattern.
- `gts` creates a signed tag.
- `gtv` validate a signed tag.

### Working directory

- `gws` displays working-tree status in the short format.
- `gwS` displays working-tree status.
- `gwd` displays changes between the working tree and the index (diff).
- `gwD` displays changes between the working tree and the index (word diff).
- `gwr` resets the current HEAD to the specified state, does not touch the
  index nor the working tree.
- `gwR` resets the current HEAD, index and working tree to the specified state.
- `gwc` removes untracked files from the working tree (dry-run).
- `gwC` removes untracked files from the working tree.
- `gwx` removes files from the working tree and from the index recursively.
- `gwX` removes files from the working tree and from the index recursively and
  forcefully.

### Shadows

The following aliases may shadow system commands:

- `gb` shadows the [GB][9].
- `gm` shadows the [Graphics Magick image processor][11].
- `gpt` shadows the [GUID partition table maintenance utility][4].
- `gs` shadows the [Ghostscript interpreter and previewer][5].

If you frequently use the above commands, you may wish to remove said aliases
from this module or to disable them at the bottom of the zshrc with `unalias`.

You can temporarily bypass an alias by prefixing it with a backward slash:
`\gpt`.

## Functions

- `git-branch-current` displays the current branch.
- `git-commit-lost` lists lost commits.
- `git-dir` displays the path to the Git directory.
- `git-hub-browse` opens the [GitHub][3] repository in the default browser.
- `git-hub-shorten-url` shortens [GitHub URLs][10].
- `git-info` exposes repository information via the `$git_info` associative
  array.
- `git-root` displays the path to the working tree root.
- `git-stash-clear-interactive` asks for confirmation before clearing the stash.
- `git-stash-dropped` lists dropped stashed states.
- `git-stash-recover` recovers given dropped stashed states.
- `git-submodule-move` moves a submodule.
- `git-submodule-remove` removes a submodule.