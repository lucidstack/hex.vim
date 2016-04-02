# hex.vim

Inspired by [alexbel's vim-rubygems](https://github.com/alexbel/vim-rubygems), this vim plugin
provides some nifty little functions to interact with your `mix.exs` file, and retrieve informations
on hex packages, without leaving the [comfort of vim](https://www.reddit.com/r/cozyplaces).

[![asciicast](https://asciinema.org/a/41100.png)](https://asciinema.org/a/41100)

## Installation

As usual, clone this repo/use whichever plugin manager you fancy, and you are ready to go!

### Prerequisites

This plugin uses [mattn/webapi-vim](https://github.com/mattn/webapi-vim) for making calls to the 
hex.pm API, so please make sure to have that cloned or in your list of plugins. 👌🏼

## How to use

### `HexAppendRelease`
Leave your cursor on a line with a package name, (like `{:ecto ` or even
`{:credo, only: [:dev, :test]}]`) and let the magic happen.

### `HexAllReleases [package]`
Leave your cursor on a line with a package name, or pass a name as only
argument to get all the releases for given package in a little pane.
```
:HexAllReleases
    or
:HexAllReleases mock

-------------------
0.1.3 (released on 2016-03-06)
0.1.2 (released on 2016-03-06)
0.1.1 (released on 2015-05-09)
0.1.0 (released on 2014-11-18)
```

### `HexAllVersions [package]`
Just an alias for `HexAllReleases` ☝🏼

### `HexPackageInfo [package]`
Leave your cursor on a line with a package name, or pass a name as only
argument to get info on the given package (from `mix hex.info`).
```
:HexPackageInfo
    or
:HexPackageInfo portmidi

-------------------
Elixir bindings to the portmidi C library

Config: {:portmidi, "~> 3.2"}
Releases: 3.2.0, 3.1.2, 3.1.1, 3.1.0, 3.0.0

Maintainers: Andrea Rossi
Licenses: MIT
Links:
  Github: https://github.com/lucidstack/ex-portmidi
```

### `HexOpenHexDocs [package]`
Open the hexdocs page for the given package (or in the line under the cursor)
in the system-default browser.  This doesn't check if hexdocs are published for
a package, so you might get some 404's here and there.

Note: this uses `open` on OSX and `xdg-open` on Linux systems.

### `HexOpenGithub [package]`
Open the github repo for the given package (or in the line under the cursor) in
the system-default browser.

Note: this uses `open` on OSX and `xdg-open` on Linux systems.
