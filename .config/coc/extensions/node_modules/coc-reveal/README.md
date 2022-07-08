# coc-reveal

Transform your Markdown to slides powered by [reveal.js](https://github.com/hakimel/reveal.js/).

This is an extension for [coc.nvim](https://github.com/neoclide/coc.nvim).

## Installation

First, make sure [coc.nvim](https://github.com/neoclide/coc.nvim) is started.

Then install with the Vim command:

```
:CocInstall coc-reveal
```

## Usage

Open a Markdown, and execute:

```viml
:CocCommand reveal.it
```

An HTML file with the same basename as the Markdown file will be created and opened in your default browser.

### Key mappings

There is no default key mapping, but you can easily add your own:

```viml
" Create slides from the whole file
nmap <Leader>r <Plug>(coc-reveal-it)
" Create slides from the selected lines
vmap <Leader>r <Plug>(coc-reveal-it-v)
```

### Commands

It is also possible to add a command to create slides.

```viml
command! -range=% RevealIt CocCommand reveal.it <line1> <line2>
```

Now you have the `:RevealIt` command to create slides, either from the whole file or selected lines.

### Front matter

You can change the default options in front matter:

```markdown
---
title: The title of my slides
author: Me
---
```
