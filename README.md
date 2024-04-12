<div align="center">

![Last commit](https://img.shields.io/github/last-commit/Comamoca/nimffui?style=flat-square)
![Repository Stars](https://img.shields.io/github/stars/Comamoca/nimffui?style=flat-square)
![Issues](https://img.shields.io/github/issues/Comamoca/nimffui?style=flat-square)
![Open Issues](https://img.shields.io/github/issues-raw/Comamoca/nimffui?style=flat-square)
![Bug Issues](https://img.shields.io/github/issues/Comamoca/nimffui/bug?style=flat-square)

<img src="https://emoji2svg.deno.dev/api/🦊" alt="eyecatch" height="100">

# nimffui

Simple fuzzy finder library for Nim.

<br>
<br>


</div>

<div align="center">

</div>

## 🚀 How to use

```nim
import ffui

var choices = ["arisu", "miria", "kaoru", "haru", "nina"]

# Launch fuzzy finder.
var selectItem = ffui(choices)

echo selectItem
```

## ⬇️  Install

```sh
nimble install https://github.com/comamoca/nimffui
```

## 📝 Todo

- [ ] improve sort algorithm.

## 📜 License

MIT

### 🧩 Modules

- [illwill](https://github.com/johnnovak/illwill)
- [fuzzy](https://github.com/pigmej/fuzzy)

## 👏 Affected projects

- [go-fuzzyfinder](https://github.com/ktr0731/go-fuzzyfinder)

## 💕 Special Thanks

- [Nim](https://nim-lang.org)
