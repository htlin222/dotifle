<h1 align="center">
  coc-zi
  <div>
    <img align="center" width="100px;" src="https://user-images.githubusercontent.com/20282795/71557618-7594f480-2a83-11ea-8858-6e5f79500de1.gif" />
  </div>
</h1>

Auto suggest english words when you type for the right place

> If `look` command does not exists it will use 10k words.

- auto suggest
- hover document using [ECDICT](https://github.com/skywind3000/ECDICT)

![](https://user-images.githubusercontent.com/5492542/67636928-7341dd00-f910-11e9-8418-09c805fa856a.png)

## Install

`:CocInstall coc-zi`

## Translators

`:CocList translators`

![](https://user-images.githubusercontent.com/5492542/67636930-76d56400-f910-11e9-8303-8aa783903384.png)

## Settings

- `zi.enable`: enable coc-zi
- `zi.trace.server`: Trace level of log
- `zi.patterns`: javascript regex patterns to enable autocomplete, empty array `[]` means enable for whole buffer. defalut:
  ``` jsonc
  "zi.patterns": {
    "": [],
    "javascript": [
      "^\\s*\\/\\/",
      "^\\s*\\/\\*",
      "^\\s*\\*"
    ],
    "typescript": [
      "^\\s*\\/\\/",
      "^\\s*\\/\\*",
      "^\\s*\\*"
    ],
    "markdown": [],
    "vim": [
      "^\\s*\\\""
    ],
    "gitcommit": []
  }
  ```
- `zi.syntaxKinds.javascript`: syntax kind to enable autocomplete. default:
  ``` jsonc
  "zi.syntaxKinds.javascript": [
    "StringLiteral",
    "NoSubstitutionTemplateLiteral",
    "TemplateHead",
    "TemplateTail",
    "TemplateMiddle"
  ]
  ```
- `zi.syntaxKinds.typescript`: syntax kind to enable autocomplete. default:
  ``` jsonc
  "zi.syntaxKinds.javascript": [
    "StringLiteral",
    "NoSubstitutionTemplateLiteral",
    "TemplateHead",
    "TemplateTail",
    "TemplateMiddle"
  ]
  ```

## Credits

- translate api is from [coc-translator](https://github.com/voldikss/coc-translator)

### Buy Me A Coffee ☕️

![btc](https://img.shields.io/keybase/btc/iamcco.svg?style=popout-square)

![image](https://user-images.githubusercontent.com/5492542/42771079-962216b0-8958-11e8-81c0-520363ce1059.png)
