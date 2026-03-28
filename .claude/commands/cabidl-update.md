# Update cabidl Homebrew formulas

Sync the Homebrew formulas in `Formula/` with all releases published on GitHub for `scalebit-com/cabidl`. This ensures every released version has a formula and the main `cabidl.rb` always points to the latest.

## How the formulas are organized

- `Formula/cabidl.rb` — always tracks the **overall latest** release. Class name: `Cabidl`.
- `Formula/cabidl@MAJOR.MINOR.rb` — one per older minor-version line, tracking the highest patch in that line. Class name: `CabidlATMAJORMINOR` (e.g., `CabidlAT01` for `@0.1`). The latest minor-version line does NOT get a versioned formula — it's already covered by `cabidl.rb`.

## Steps

### 1. Fetch all GitHub releases

```bash
gh release list --repo scalebit-com/cabidl --limit 100 --json tagName,isLatest
```

Parse each tag (format `vMAJOR.MINOR.PATCH`) into a semver triple.

### 2. Inventory existing formulas

List `Formula/cabidl*.rb` files. Parse the version from each file (the `version "X.Y.Z"` line). Build a map of what's already covered.

### 3. Determine what needs updating

Group all releases by their minor version line (`MAJOR.MINOR`). Within each group, pick the highest patch. Identify:

- The overall latest release (highest semver across all releases).
- Which minor-version lines need a versioned formula (all except the latest minor line).

Compare against existing formulas. A formula needs creating or updating if:
- It doesn't exist yet, OR
- Its current version differs from the target version for that slot.

### 4. Fetch asset metadata for each version that needs a formula

For each version that needs creating or updating:

```bash
gh release view vX.Y.Z --repo scalebit-com/cabidl --json assets
```

From the assets JSON, extract the `url` and `digest` (sha256) for these four assets only:
- `cabidl-X.Y.Z-macos-arm64.tar.gz`
- `cabidl-X.Y.Z-macos-x86_64.tar.gz`
- `cabidl-X.Y.Z-linux-arm64.tar.gz`
- `cabidl-X.Y.Z-linux-x86_64.tar.gz`

Skip any Windows assets. The `digest` field from the GitHub API is in format `sha256:HASH` — strip the prefix to get the bare hex hash.

### 5. Write / update formula files

Use this exact template for each formula. The only differences between the main formula and versioned formulas are: the class name, the version string, and the URLs/hashes.

```ruby
class CLASS_NAME < Formula
  desc "Component Architecture Boundary and Interface Definition Language"
  homepage "https://github.com/scalebit-com/cabidl"
  version "X.Y.Z"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/vX.Y.Z/cabidl-X.Y.Z-macos-arm64.tar.gz"
      sha256 "HASH"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/vX.Y.Z/cabidl-X.Y.Z-macos-x86_64.tar.gz"
      sha256 "HASH"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/scalebit-com/cabidl/releases/download/vX.Y.Z/cabidl-X.Y.Z-linux-arm64.tar.gz"
      sha256 "HASH"
    else
      url "https://github.com/scalebit-com/cabidl/releases/download/vX.Y.Z/cabidl-X.Y.Z-linux-x86_64.tar.gz"
      sha256 "HASH"
    end
  end

  def install
    bin.install "cabidl"
  end

  test do
    assert_match "cabidl", shell_output("#{bin}/cabidl --version")
  end
end
```

**Class naming rules:**
- Main formula (`cabidl.rb`): `Cabidl`
- Versioned formula (`cabidl@0.1.rb`): `CabidlAT01`
- Versioned formula (`cabidl@1.3.rb`): `CabidlAT13`

Pattern: `CabidlAT` + major digit + minor digit (no dots, no separators).

### 6. Clean up stale formulas

If a versioned formula exists for a minor line that is now the latest (because a new release promoted it), delete that versioned formula file — the main `cabidl.rb` now covers it.

### 7. Report results

Print a summary:
- Which formulas were created (with version)
- Which formulas were updated (old version → new version)
- Which formulas were removed (promoted to latest)
- Which formulas were already up to date
