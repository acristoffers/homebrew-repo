# Álan Crístoffer' Repo

To install the formulas on this repository:

```bash
brew tap acristoffers/repo
brew install moirai
brew cask install lachesis
```

The `brew fixlinks` command will relink formulas which are marked as linked but
their executables (`/bin/*` and `/lib/*`) are not present in Homebrew's `bin`
and `lib` directories. For casks, it reinstalls the cask if it has an app that
is not present.
