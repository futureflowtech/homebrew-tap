# futureflowtech/homebrew-tap

Homebrew tap for FutureFlow command-line tools.

## graphiti

An offline memory and context CLI backed by embedded CozoDB and redb.
Available for Apple Silicon and Linux ARM64 (glibc 2.34 or newer).

```sh
brew install futureflowtech/tap/graphiti
graphiti remember --group project 'Use rustls for gateway TLS.'
graphiti recall --group project rustls
graphiti eval
```

If Homebrew asks you to trust the formula, run `brew tap futureflowtech/tap`
and `brew trust --formula futureflowtech/tap/graphiti`, then retry the install.

Use `graphiti --help` for linked notes, JSON output, and deletion. Notes are
stored in a local file; no server, API key, or model is required. The built-in
evaluation uses a temporary synthetic corpus and does not touch your notes.
The [release assets](https://github.com/futureflowtech/homebrew-tap/releases?q=graphiti)
include the corresponding Cozo source.

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

If Homebrew asks you to trust the formula, run
`brew trust --formula futureflowtech/tap/codegraph-cli` and retry the install.

This installs the `codegraph-cli` binary (with a `codegraph` alias). Verify:

```sh
codegraph-cli version
```

### Upgrade

```sh
brew update && brew upgrade futureflowtech/tap/codegraph-cli
```

### Platforms

Prebuilt binaries are published for macOS 13+ (Apple Silicon and Intel) and
Linux with glibc 2.34+ (ARM64 and x86-64). The binaries are distributed
obfuscated; the formula installs the appropriate release asset. The
[release assets](https://github.com/futureflowtech/homebrew-tap/releases?q=codegraph)
include the corresponding Cozo source for 1.2.0 and later releases that bundle it.

---

Codegraph release source is maintained in the private `converse` repository.
