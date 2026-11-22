# futureflowtech/homebrew-tap

Homebrew tap for FutureFlow command-line tools.

## graphiti

An offline memory and context CLI backed by embedded CozoDB and redb.
Available for Apple Silicon and Linux ARM64 (glibc 2.34 or newer).

```sh
brew install futureflowtech/tap/graphiti
graphiti remember --group project 'Use rustls for gateway TLS.'
graphiti recall --group project --links rustls
graphiti eval
```

If Homebrew asks you to trust the formula, run `brew tap futureflowtech/tap`
and `brew trust --formula futureflowtech/tap/graphiti`, then retry the install.

Beyond notes, `graphiti` drives the same embedded graph engine from the
shell: `search` (BM25, vector, graph traversal, hybrid RRF, structured
filters, and all recipes), `similar`, `episode`, `fact`, `entity`,
`community`, `graph export/import`, `queue`/`worker` for the durable
ingestion queue, `reflect`/`note synthesize`, and `index`/`db` maintenance.

Everything stays on the machine: the redb file is local, and the optional
OpenAI-compatible model endpoint is restricted to loopback (`127.0.0.1`,
`localhost`, `::1`). Commands that need embeddings or chat require an
explicit model; the rest run without one. `graphiti eval` exercises the
embedded store on a temporary synthetic corpus — exact and HNSW search,
linked context, and group isolation — without touching your notes.

Run `graphiti --help` for the full command list and `graphiti <command>
--help` for options. The
[release assets](https://github.com/futureflowtech/homebrew-tap/releases?q=graphiti)
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
