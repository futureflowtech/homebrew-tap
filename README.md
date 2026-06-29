# futureflowtech/homebrew-tap

Homebrew tap for FutureFlow command-line tools.

## codegraph-cli

A structural code graph — index a source tree and query callers, callees,
impact radius, dead code, communities, flows, hotspots, and more.

### Install

```sh
brew install futureflowtech/tap/codegraph-cli
```

or:

```sh
brew tap futureflowtech/tap
brew install codegraph-cli
```

This installs the `codegraph-cli` binary (with a `codegraph` alias). Verify:

```sh
codegraph-cli version
```

### Upgrade

```sh
brew update && brew upgrade codegraph-cli
```

### Platforms

Prebuilt binaries are published for macOS (Apple Silicon + Intel) and Linux
(arm64 + x86_64). The binaries are distributed obfuscated; the formula simply
downloads and installs the appropriate release asset.

---

Releases and this formula are published automatically by the
`release-codegraph` workflow in the (private) `converse` repository.
