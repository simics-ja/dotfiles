# Troubleshooting

## PHP via mise on WSL + Linuxbrew

**Cause:** Brew's `pkg-config` takes precedence in `PATH` but cannot find OpenSSL's `.pc` files by default. Set `PKG_CONFIG_PATH` explicitly.

Install dependencies once:

```sh
sudo apt install -y build-essential
brew install autoconf bison re2c pkgconf openssl@3 icu4c libxml2 curl zlib libzip oniguruma readline gd sqlite
```

Install PHP (change the version as needed):

```sh
PKG_CONFIG_PATH="$(brew --prefix openssl@3 icu4c libxml2 curl zlib | sed 's|$|/lib/pkgconfig|' | paste -sd:):$(brew --prefix)/lib/pkgconfig" \
LDFLAGS="-L$(brew --prefix)/lib -Wl,-rpath,$(brew --prefix)/lib" \
PHP_EXTRA_CONFIGURE_OPTIONS="--with-readline=$(brew --prefix readline)" \
mise use --global php@8.5.12
```

Use `PHP_EXTRA_CONFIGURE_OPTIONS`; `PHP_CONFIGURE_OPTIONS` replaces defaults.
Remove old PHP build overrides from mise config and clear stale shell variables before using this command. No hard-coded paths or persistent build settings needed.
