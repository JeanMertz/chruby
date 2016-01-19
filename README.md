# chruby-fish

[![Build Status](http://img.shields.io/travis/JeanMertz/chruby-fish.svg)][ci]

Thin wrapper around [chruby][] to make it work with the [Fish shell][]

## install

**note** that `chruby-fish` is dependent on `chruby`, please
[install it first][].

```bash
wget -O chruby-fish-0.7.2.tar.gz https://github.com/JeanMertz/chruby-fish/archive/v0.7.2.tar.gz
tar -xzvf chruby-fish-0.7.2.tar.gz
cd chruby-fish-0.7.2/
sudo make install
```

### Homebrew

chruby-fish can also be installed with [homebrew][]:

```sh
brew install chruby-fish
```

Or the absolute latest chruby-fish can be installed from source:

```sh
brew install chruby-fish --HEAD
```

chruby is installed as a dependency of chruby-fish, if you installed chruby
manually, add the `--without-chruby` flag to the above commands.

## configuration

Add the following line to your `config.fish` file:

```sh
source /usr/local/share/chruby/chruby.fish
```

To enable auto-switching, also add the `auto.fish` file:

```sh
source /usr/local/share/chruby/auto.fish
```

If you use a custom install location for chruby, use the
[`CHRUBY_ROOT` variable][chruby_root] to point in the right direction.

For more general instructions, see the [chruby documentation][].

## Known Issues

* Invalid PATH warning by Fish shell

  If you see a warning similar to

  ```txt
  set: Warning: path component /path/to/ruby-x.y.z/lib/ruby/gems/x.y.z/bin may not be valid in PATH.
  set: No such file or directory
  ```

  you can silence it by creating that directory:

  ```sh
  mkdir -p /path/to/ruby-x.y.z/lib/ruby/gems/x.y.z/bin
  ```

## License & Authors

Author: Jean Mertz - jean@mertz.fm

```text
The MIT License (MIT)

Copyright (c) 2014 Jean Mertz <jean@mertz.fm>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```

[ci]: http://travis-ci.org/JeanMertz/chruby-fish
[gittip]: https://www.gittip.com/JeanMertz
[chruby]: https://github.com/postmodern/chruby
[fish shell]: http://fishshell.com
[install it first]: https://github.com/postmodern/chruby#install
[homebrew]: http://brew.sh/
[chruby_root]: https://github.com/JeanMertz/chruby-fish/blob/ad62361884941067485df6c417959cdc2a42c182/share/chruby/chruby.fish#L33-L34
[chruby documentation]: https://github.com/postmodern/chruby#chruby
