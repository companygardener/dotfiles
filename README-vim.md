# Vim Configuration

Two-file setup: `vimrc` (plugins and filetype settings) loads `vimrc.after` (everything else).

## Plugin Manager

Vundle. Commands: `<leader>vi` install, `<leader>vu` update, `<leader>vl` list, `<leader>vc` clean, `<leader>vs` search.

## Key Mappings

Leader is `\` (default).

### Navigation & Windows

| Mapping | Action |
| --- | --- |
| `<C-h/j/k/l>` | Move between splits |
| `<leader>w` | Vertical split and move right |
| `<leader>W` | Horizontal split and move down |
| `<leader>=` | Equalize split sizes |
| `<tab>` | Jump to matching bracket (like `%`) |
| `;` | Enter command mode (replaces `:`) |
| `-` | NERDTreeFind (reveal current file) |

### File & Buffer

| Mapping | Action |
| --- | --- |
| `<leader>n` | Toggle NERDTree |
| `<leader>N` | Toggle NERDTree (quit on open) |
| `<leader>f` | Find current file in NERDTree |
| `<leader>b` | Bookmark in NERDTree |
| `<leader>cd` | cd to current file's directory |
| `<leader>..` | cd up one directory |
| `` ` `` | Toggle fullscreen |
| `<S-`>` | ZoomWin (toggle zoom current split) |
| `<leader>ff` | Fullscreen + ZoomWin |
| `<C-p>` | CtrlP fuzzy finder |

### Editing

| Mapping | Action |
| --- | --- |
| `<leader>fef` | Re-indent entire file |
| `<leader>se` | Strip trailing whitespace |
| `<leader>q` | Re-hardwrap paragraph (normal) or selection (visual) |
| `<leader>rr` | Redo |
| `<leader>pp` | Toggle paste mode |
| `jk` | Escape from insert mode |
| `vv` | Escape and select line (from insert) |
| `vq` | Escape and rewrap line (from insert) |
| `w!!` | Sudo write (command mode) |
| `:W` `:Q` `:Wq` `:WQ` | Typo-tolerant commands |

### Search

| Mapping | Action |
| --- | --- |
| `/` | Search with `\v` (very magic / regex mode) |
| `<leader><space>` | Clear search highlights |
| `<leader>th` | Toggle search highlighting |

### Alignment (Tabular)

| Mapping | Action |
| --- | --- |
| `<leader>a\|` | Align on `\|` |
| `<leader>a<space>` | Align on whitespace |
| `<leader>a:` | Align on `:` (left-aligned keys) |
| `<leader>ar:` | Align on `:` (right-aligned keys) |
| `<leader>a,` | Align on `,` |
| `<leader>a=` | Align on `=` |
| `<leader>a>` | Align on `=>` |
| `<leader>am2` | Align markdown table (2 data columns) |
| `<leader>am3` | Align markdown table (3 data columns) |
| `\|` (insert mode) | Auto-align table as you type |

### Markdown

| Mapping | Action |
| --- | --- |
| `<leader>1` | Underline with `=` (H1) |
| `<leader>2` | Underline with `-` (H2) |
| `<leader>md` | Open in Marked 2 |

### Git (Fugitive)

| Mapping | Action |
| --- | --- |
| `<leader>gb` | Git blame |
| `<leader>gc` | Git commit |
| `<leader>gd` | Git diff |
| `<leader>gl` | Git log |
| `<leader>gp` | Git push |
| `<leader>gs` | Git status |

### Spelling

| Mapping | Action |
| --- | --- |
| `<leader>st` | Toggle spell check |
| `<leader>sn` | Next misspelling |
| `<leader>sp` | Previous misspelling |
| `<leader>sa` | Add word to dictionary |
| `<leader>s?` | Suggest corrections |

### Ruby

| Mapping | Action |
| --- | --- |
| `<leader>rh` | Convert hashrockets to new-style hashes |
| `<C-l>` (insert) | Insert ` => ` |
| `<leader>tr` | Open routes.rb in vsplit |
| `<leader>tg` | Open Gemfile in vsplit |

### Tab Settings

| Mapping | Action |
| --- | --- |
| `<leader>t2` | 2-space soft tabs |
| `<leader>t4` | 4-space soft tabs |
| `<leader>T2` | 2-space hard tabs |
| `<leader>T4` | 4-space hard tabs |
| `<leader>T8` | 8-space hard tabs |

### Display

| Mapping | Action |
| --- | --- |
| `<leader>i` | Toggle invisible characters |
| `<leader>tw` | Toggle line wrap |
| `<leader>ds` | Show syntax highlight group under cursor |
| `<leader><leader>` | Goyo (distraction-free mode) |
| `<leader>rt` | Toggle Tagbar |

### Box Drawing (insert and normal)

| Mapping | Action |
| --- | --- |
| `<leader>dl` | `├─ ` |
| `<leader>dk` | `└─ ` |
| `<leader>d-` | `─` |
| `<leader>dj` | `│  ` |

### Unicode (insert mode)

Prefix `<leader>u` followed by category:

- `S0`-`S9`, `S+`, `S-`, `S=`, `S(`, `S)`, `Si`, `Sn` — superscripts
- `s0`-`s9`, `s+`, `s-`, `s=`, `s(`, `s)`, `sa`-`sx` — subscripts
- `t<space>`, `t-`, `tn`, `tm`, `t.`, `ts`, `tp` — typography (thin space, non-breaking hyphen, en/em dash, middle dot, section, pilcrow)
- `q'`, `Q'`, `q"`, `Q"` — smart quotes
- `...` — ellipsis, `***` — asterism
- `b+` `b-` — check/cross marks
- `an` `au` `ad` `ar` `al` — arrows
- `ms` `mS` `mE` — integral, double integral, summation
- `m?=` `m?2` `m!=` `m<=` `m>=` `m.` `m-` `m/` `md` `mx` `m~` — math operators
- `=−` — plus-minus

### Abbreviations (insert mode)

| Abbreviation | Expands to |
| --- | --- |
| `xd` | Current date (MM/DD/YYYY) |
| `xt` | Current datetime |
| `RuL` | 100-column ruler |

## Statusline

Custom statusline showing: filename, long line warnings, file format/encoding warnings, trailing whitespace warning, mixed indentation warning, Syntastic errors, paste mode, read-only/modified flags, Fugitive branch, syntax highlight group, filetype, encoding, Unicode codepoint, line/column/percentage.

## Filetype Settings

| Filetype | Settings |
| --- | --- |
| Markdown/txt | soft wrap, spell check, no hard wrapping |
| Python | 4-space indentation |
| Ruby/HTML/JS/YAML/etc | 2-space indentation |
| SQL | 4-space indentation |
| Make | hard tabs |
| Mail | no auto-indent, textwidth=72, spell check |

## Color Scheme

Tungsten (custom), with Solarized, Railscasts, Jellybeans, Hybrid, and Vanzan available.

## Search

Uses `ag` (the_silver_searcher) for `:grep` and CtrlP file indexing when available.
