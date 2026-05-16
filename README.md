# nagnagi Neovim Configurations

Neovimのいろんな設定

## 依存関係

以下のツールのインストールが必要です。

**必須**

| パッケージ | 用途 |
| ---------- | ---- |
| Git     | プラグインのダウンロード  |
| GCC     | プラグインのビルド        |
| Make    | プラグインのビルド        |
| CMake   | プラグインのビルド        |
| fzf     | Telescopeの依存           |
| ripgrep | Telescopeの依存(Livegrep) |
| deno    | denops.vimの起動          |

**推奨**

| パッケージ | 用途 |
| ---------- | ---- |
| lua5           | luaのランタイム |
| Python3.13     | LSPの起動       |
| Node.js        | LSPの起動       |
| Cargo          | LSPの起動       |
| GitHub CLI     | octo.vimの依存  |
| Pandoc         | Orgfileのexport |
| treesitter-cli | Orgmodeの起動   |

**任意**

| パッケージ | 用途 |
| ---------- | ---- |
| LazyGit    | GitのTUI補助ツール          |
| LazyDocker | DockerのTUI補助ツール       |
| GoBang     | データベースのTUI補助ツール |
| LazySQL    | データベースのTUI補助ツール |
| gh dash    | GitHubCLIの補助ツール       |

## アイコンについて

エディタの中で使用しているほとんどのアイコンは、Nerd Fontを用いています。
以下からダウンロード（もしくはパッケージマネージャからインストール）してください。

=> [Nerd Fonts](https://www.nerdfonts.com/)

## キーバインドと操作

Neovimの基本キーバインドについては、大きく変更は行っていません。

### プラグインの操作

プラグインの操作は、`<leader>`プレフィックスで行います。
`<leader>`キーは、`\\`に設定されています。

**主要な操作**

| キー | 操作 |
| ---- | ---- |
| `<leader>f` | Finder        (ファジーファインダー) |
| `<leader>x` | trouble       (エラーリスト)         |
| `<leader>e` | Explore       (ファイラー)           |
| `<leader>r` | Run; Overseer (タスクランナー)       |
| `<leader>t` | Terminal      (ターミナル)           |
| `<leader>a` | Aerial        (シンボルツリー)       |
| `<leader>g` | GitHub        (リモート操作)         |
| `<leader>h` | Hist          (Git)                  |

一部のプラグインのみ、特殊なキーを設定しています。

| キー | 操作 |
| ---- | ---- |
| `<C-j><C-f>` | ファイル検索 |
| `<C-j><C-g>` | 文字検索     |
| `<C-j><C-e>` | ファイラー   |
| `<C-j><C-t>` | ターミナル   |

### insertモードの操作

insertモードでは、一部のキーバインドを追加しています。

| キー | 操作 |
| ---- | ---- |
| `<C-f>` | Forward   |
| `<C-b>` | Back      |
| `<C-a>` | Ahead     |
| `<C-e>` | End       |
| `<C-k>` | SKKの開始 |

## ノート操作

ノートはOrgmode, Telekastenの2つのプラグインを導入しています。

**Orgmode**

操作は、`<leader>o`で行います。

このプラグインでは、Orgというファイル形式で記述します。

=> [Org Mode](https://orgmode.org/)

少し(というかかなり)難しいので、最初のうちは使わないでおきましょう。

主な利用フロー

1. `<leader>oct`: ToDoを作成する
2. `<leader>oaa`: Agenda Viewを開く
3. `<Tab>`      : ToDoを開く
4. `citp`       : ToDoをINPROGRESSにする
5. `<leader>oxi`: Clockを開始する 
6. ...

**Telekasten**

操作は、`<leader>m`で行います。

このプラグインでは、Markdownというファイル形式で記述します。

=> [GitHub Markdown](https://github.github.com/gfm/)

こちらは簡単に使うことができます。

主な利用フロー

1. `<leader>mm`: Telekastenメニューを開く
2. つかう

