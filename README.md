# futureflowtech/homebrew-tap

Homebrew tap for FutureFlow command-line tools.

## solidup-memory

An offline memory and context CLI backed by embedded CozoDB and redb.
Available for Apple Silicon.

```sh
brew install futureflowtech/tap/solidup-memory
solidup-memory remember --group project 'Use rustls for gateway TLS.'
solidup-memory recall --group project --links rustls
solidup-memory eval
```

If Homebrew asks you to trust the formula, run `brew tap futureflowtech/tap`
and `brew trust --formula futureflowtech/tap/solidup-memory`, then retry the install.

Beyond notes, `solidup-memory` drives the same embedded graph engine from the
shell: `search` (BM25, vector, graph traversal, hybrid RRF, structured
filters, and all recipes), `similar`, `episode`, `fact`, `entity`,
`community`, `graph export/import`, `queue`/`worker` for the durable
ingestion queue, `reflect`/`note synthesize`, and `index`/`db` maintenance.

Everything stays on the machine: the redb file is local, and every optional
OpenAI-compatible endpoint is restricted to loopback (`127.0.0.1`,
`localhost`, `::1`). Chat and embeddings can use different servers
(`--chat-url`, `--embed-url`); `--thinking=auto|off|on` controls reasoning
models, and `--embed-query-prefix` / `--embed-doc-prefix` cover models such
as EmbeddingGemma that expect instruction prefixes. Commands that need
embeddings or chat require an explicit model; the rest run without one.

Read-only commands skip schema DDL, never create a missing database, and wait
for a concurrent writer instead of failing with a lock error. `solidup-memory eval`
exercises the embedded store on a temporary synthetic corpus — exact and HNSW
search, linked context, and group isolation — without touching your notes.

Run `solidup-memory --help` for the full command list and `solidup-memory <command>
--help` for options. The
[release assets](https://github.com/futureflowtech/homebrew-tap/releases?q=solidup-memory)
include the corresponding Cozo source.

## solidup-code

A structural code graph — index a source tree and query callers, callees,
impact radius, dead code, communities, flows, hotspots, and more.

### Install

```sh
brew install futureflowtech/tap/solidup-code
```

or:

```sh
brew tap futureflowtech/tap
brew install solidup-code
```

If Homebrew asks you to trust the formula, run
`brew trust --formula futureflowtech/tap/solidup-code` and retry the install.

This installs the `solidup-code` binary. Verify:

```sh
solidup-code version
```

Running `solidup-code` with no arguments prints index status; writes require an
explicit `solidup-code index`, `solidup-code sync`, or `solidup-code init`. Parallel
query commands wait for the index lock instead of failing, status counters
are materialized after each full index/sync, and `explore` accepts a
`--timeout`.

```sh
solidup-code unresolved                 # unresolved refs by language, kind, and file
solidup-code enrich scip-index.json     # add compiler-resolved edges from SCIP
solidup-code explore --timeout 20s TokenA TokenB
```

### Upgrade

```sh
brew update && brew upgrade futureflowtech/tap/solidup-code
```

### Platforms

Prebuilt binaries are published for macOS 13+ (Apple Silicon). The binaries are distributed
obfuscated; the formula installs the appropriate release asset. The
[release assets](https://github.com/futureflowtech/homebrew-tap/releases?q=solidup-code)
include the corresponding Cozo source.

---

Solidup Code release source is maintained in the private `converse` repository.
