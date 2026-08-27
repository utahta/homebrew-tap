# homebrew-tap

Homebrew tap for utahta's apps.

## Kikiyaku

A macOS menu bar app for live transcription and translation — see
[utahta/kikiyaku](https://github.com/utahta/kikiyaku).

```sh
brew install --cask utahta/tap/kikiyaku
```

Kikiyaku is not notarized by Apple, so macOS would quarantine the download and
refuse to open it. The cask clears that flag on install, which is the reason to
prefer it over downloading the app by hand.

## Updating

`Casks/kikiyaku.rb` is written by the release workflow in the app's repository
from `packaging/homebrew/kikiyaku.rb.template` there. Edit the template rather
than the cask, or the next release will overwrite the change.
