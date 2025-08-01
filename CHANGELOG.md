<!-- markdownlint-disable MD013 MD024 -->

# Change log

## master (unreleased)

### New features

- [PR 1432](https://github.com/bbatsov/prelude/pull/1432): Allow directories of custom Emacs Lisp files in `personal/preload`.
- Enable `org-habits`.
- Neatly track `TODO` state changes in a drawer (LOGBOOK), thereby improving readability.
- Add a module to enable Literate Programming (`prelude-literal-programming.el`).
- Add a Racket module.
- Add a Lua module.
- Auto-install `racket-mode` if needed.
- Add a F# module.
- Auto-install `use-package`.
- Add `prelude-vertico` module. Vertico a simpler alternative to `ivy-mode` and supersedes Selectrum.
- [#1421](https://github.com/bbatsov/prelude/issues/1421): Make it possible to configure the TypeScript format action using `prelude-ts-format-action`.
- [#1354](https://github.com/bbatsov/prelude/issues/1354): Remove default `C--` and `C-+` keybindings to increase/decrease the font size.
- Add `prelude-projectile` user option, allowing Projectile integration to be disabled.
- Add `prelude-hippie-expand` user option, allowing hippie-expand support to be disabled.

### Changes

- Remove redundant addition to `auto-mode-alist` for Markdown
  (note: this reverts the default to `markdown-mode` instead of `gfm-mode`).
- Bind all essential `avy` commands to their recommended keybindings.
- Remove `company-lsp`.
- Replace `yank-pop` key-binding to `counse-yank-pop` for `ivy-mode`.
- The keybinding for `proced` is now enabled unconditionally.
- Replace prelude-go backend with `lsp` instead of unmaintained tools.
- Use `rust-analyzer` as language server for prelude-rust and provide nicer syntax highlighting with `tree-sitter`.
- Use `js2-mode` for Node.js specific `.cjs` and `.mjs` extensions.
- Add `prelude-undo-tree` custom variable: allows user disable
  undo-tree integration. Enabled by default to maintain backward-compatibility.

### Bugs fixed

- [PR 1433](https://github.com/bbatsov/prelude/pull/1433): Remove a duplicate `when` call in `modules/prelude-helm-everywhere.el` causing an emacs init error when `prelude-helm-everywhere` is enabled.
- Fix `company` still being visible in the mode line.
- [#1335](https://github.com/bbatsov/prelude/issues/1335): Workaround
  for `which-key` bug causing display issues in clients to `emacs --daemon`.
- Fix **Edit on GitHub** link in ReadTheDocs site.
- Fix fall back to sample `prelude-modules.el` not working if user has installed to non-default location.
- Stop requiring `helm-config` since upstream has removed the module.
- Require `typescript-mode` using `prelude-require-packages` to avoid error upon inclusion in `personal/prelude-modules.el`.
- Turn off `super-save` in `rust-mode` to prevent severe hangs during autocomplete.
- Update `prelude-dart.el` to use `lsp-dart-dap-setup` instead of deprecated `dap-dart-setup` function.

## 1.1.0 (2021-02-14)

### New features

- Enable `nlinum-mode` or `display-line-numbers-mode` by default. Can be disabled by setting `prelude-minimalistic-ui` to `t`.
- Enable site-wide installation for Prelude.
- Auto-installs `julia-mode` if needed.
- Auto-install `adoc-mode` for AsciiDoc files.
- Add the `ag` package. It provides a nice alternative to `grep` and has nice Projectile integration.
- Added additional configuration modules for WSL (`prelude-wsl`) and Windows (`prelude-windows`).
- Add `prelude-selectrum` module. Selectrum a simpler alternative to `ivy-mode`.

### Changes

- [#1292](https://github.com/bbatsov/prelude/issues/1292): Add `prelude-python-mode-set-encoding-automatically` defcustom inn `prelude-python.el` module with nil default value.
- [#1278](https://github.com/bbatsov/prelude/issues/1278): Don't disable `menu-bar-mode` unless `prelude-minimalistic-ui` is enabled.
- [#1277](https://github.com/bbatsov/prelude/issues/1277): Make it possible to disable the creation of `Super`-based keybindings via `prelude-super-keybindings`.
- Removed deprecated alias `prelude-ensure-module-deps`.
- Remove `prelude-fullscreen`, as these days people can use `toggle-frame-fullscreen` instead. (it was introduced in Emacs 24.4)
- Removed `beacon-mode`.
- Added `transient/` to `.gitignore`.
- Fallback to `sample/prelude-modules.el` in the absence of a `prelude-modules.el` in one's personal folder.
- [Ruby] Don't auto-insert coding comments.
- Hide (via `diminish`) `editorconfig-mode`, `super-save`, `company`, `abbrev` and `ivy` in the modeline.
- Use `lsp-workspace-restart` function instead of deprecated `lsp-restart-workspace`.
- Bind all online search commands under `C-c C-/` to avoid a conflict with `counsel-git` or `magit-file-dispatch`.
- Bound `magit-file-mode` to `C-c g` (it's also bound to `C-c M-g` if you decide to utilize this keybinding for something else.
- Added `.cache/` and `lsp-session*` to `.gitignore`. These are generated by `lsp`.

### Bugs fixed

- [#1302](https://github.com/bbatsov/prelude/issues/1302): `C-a` should be bound to `org-beginning-of-line` in org-mode buffers.

## 1.0.0 (2020-09-15)

Initial "stable" release after 9 years of development.
