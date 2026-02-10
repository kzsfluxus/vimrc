# Vim konfigurációs fájl

Ez a projekt egy testreszabott Vim konfigurációt tartalmaz, amely fejlett funkciókat kínál a kódszerkesztéshez, adatbázis-kezeléshez és többnyelvű programozáshoz.

## Telepítés

A konfiguráció automatikus telepítéséhez futtasd a következő parancsot:

```bash
./setup.sh
```

A script automatikusan:
- Telepíti az alap csomagokat (vim, git, curl) a rendszer csomagkezelőjével
- Letölti és telepíti a vim-plug plugin managert
- Létrehozza a szükséges könyvtárakat (`~/.vim/autoload`, `~/.vim/plugged`, `~/.vim/undodir`, `~/.config/db_ui`)
- Átmásolja a színsémákat (`~/.vim/colors/`)
- Beállítja a `.vimrc` fájlt
- Átmásolja a DadBod UI kapcsolat konfigurációt
- Telepíti az összes Vim plugint

### Támogatott rendszerek
- **Ubuntu/Debian** - apt csomagkezelő
- **Fedora/RHEL** - dnf csomagkezelő  
- **Arch Linux** - pacman csomagkezelő
- **openSUSE** - zypper csomagkezelő

### Manuális telepítés

Ha a setup.sh nem működik, akkor manuálisan:

1. Telepítsd az alap csomagokat:
```bash
# Ubuntu/Debian
sudo apt install vim git curl

# Fedora
sudo dnf install vim git curl

# Arch Linux
sudo pacman -S vim git curl
```

2. Másold a konfigurációs fájlokat:
```bash
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/colors ~/.vim/undodir ~/.config/db_ui
cp .vim/colors/* ~/.vim/colors/
cp .config/db_ui/connections.json ~/.config/db_ui/
```

3. Telepítsd a vim-plug managert:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

4. Telepítsd a plugineket:
```vim
vim +PlugInstall +qall
```

## Projekt struktúra

```
.
├── $HOME                       # felhasználó home könyvtára
├── .vimrc                      # Vim konfigurációs fájl
├── .vim/
│   └── colors/                 # Egyedi színsémák
└── .config/
    └── db_ui/
        └── connections.json    # Adatbázis kapcsolatok
```

### Alap beállítások
- UTF-8 kódolás
- Vi kompatibilitás kikapcsolása
- Gyorsabb terminál renderelés
- Sorszámozás engedélyezése
- Sötét háttér színséma
- Szintaxis kiemelés
- Egér támogatás
- Rendszer vágólap integrációja

### Szerkesztési beállítások
- Automatikus behúzás
- 4 szóköz tab méret
- 8 sor görgetési margó
- 300ms frissítési idő
- Rejtett bufferek támogatása

### Keresési beállítások
- Kis- és nagybetű intelligens keresés
- Keresési találatok kiemelése
- Fokozatos keresés
- Wildmenu engedélyezése

### Fájlkezelés
- Nincs backup fájl (.bak)
- Nincs swap fájl (.swp)
- Perzisztens undo történet
- Undo fájlok: `~/.vim/undodir`

## Telepített pluginek

### Kiegészítő funkciók
- **Codeium** - AI kódkiegészítés
- **NERDTree** - Fájlkezelő fa
- **NERDTree Buffer Ops** - Buffer műveletek
- **Commentary** - Gyors kommentelés
- **Syntastic** - Szintaxis ellenőrzés
- **FZF** - Fuzzy finder
- **Lightline** - Státuszsor
- **GitGutter** - Git változások megjelenítése
- **Fugitive** - Git integráció
- **Auto-pairs** - Automatikus zárójel párosítás
- **Tabular** - Szöveg igazítás

### Nyelvi támogatás
- **C/C++** - Enhanced C/C++ syntax
- **HTML5** - Modern HTML syntax
- **CSS3** - CSS3 syntax support
- **JavaScript** - ES6+ syntax
- **TypeScript** - TypeScript support
- **JSX** - React JSX syntax
- **GraphQL** - GraphQL syntax
- **PHP** - PHPActor LSP server
- **Emmet** - HTML/CSS gyorskódok
- **Rust** - Rust language support
- **Perl** - Perl syntax
- **Python** - PEP8 indentation
- **Vala** - Vala syntax
- **Vue.js** - Vue component syntax
- **Markdown** - Enhanced markdown
- **LaTeX** - VimTeX support

### Vizuális kiegészítők
- **Coloresque** - Színkódok megjelenítése
- **Sass Colors** - Sass színek

### Adatbázis kezelés

A konfiguráció tartalmaz előre beállított adatbázis kapcsolatokat a `~/.config/db_ui/connections.json` fájlban. A DadBod UI beállításai:

- Konfiguráció helye: `~/.config/db_ui`
- Nerd fontok használata
- 30 karakter széles ablak
- Bal oldali elhelyezés
- Függőleges eredmény layout
- Automatikus tábla segédek

### Speciális fájlformátumok
- **CSV.vim** - CSV fájlok kezelése

## Billentyűparancsok

### NERDTree
- `F2` - NERDTree toggle

### Adatbázis kezelés (DadBod)
- `<leader>db` - DadBod UI toggle
- `<leader>df` - DadBod fájl keresés
- `<leader>dr` - DadBod buffer átnevezés

### Kommentelés
- `gcc` - Sor kommentelése/kikommentelése
- `gc` - Kijelölt terület kommentelése

## Speciális beállítások

### VimTeX
- PDF viewer: Zathura
- Compiler: latexrun
- Local leader: `,` (vessző)
- Automatikus PDF megjelenítés

### Syntastic
- Automatikus szintaxis ellenőrzés
- Location list automatikus frissítése
- Ellenőrzés fájl megnyitáskor

### NERDTree automatizmusok
- Automatikus megnyitás könyvtár argumentumnál
- Automatikus bezárás, ha az utolsó ablak
- Hidden fájlok megjelenítése
- Bezárás fájl megnyitása után

## Fájltípus specifikus beállítások

### Python
- 4 szóköz behúzás
- Tab → szóköz konverzió

### Makefile
- Tab karakterek megtartása
- 8 karakteres tab szélesség

### Assembly
- NASM szintaxis `.asm` fájlokhoz

## Szükséges külső függőségek

### LaTeX támogatáshoz
- `texlive` - LaTeX disztribúció
- `zathura` - PDF viewer
- `latexrun` vagy `latexmk` - Compiler

### PHP fejlesztéshez
- `php` (>= 8.1)
- `composer`
- `php-mbstring`

### Rust fejlesztéshez
- `rustc` - Rust compiler
- `cargo` - Rust package manager
- `rustfmt` - Kód formázó

### FZF kereséséhez
- `fzf` - Fuzzy finder
- `ripgrep` - Gyors grep
- `silversearcher-ag` - Szöveg keresés
- `universal-ctags` - Kód indexelés

### Codeium AI-hoz
- Regisztráció: https://codeium.com
- API kulcs beállítása

## Színséma

Az alapértelmezett színséma: **iceberg**

Változtatáshoz módosítsd a `.vimrc` fájlban:
```vim
colorscheme <új_színséma_neve>
```

## Testreszabás

A konfiguráció bármikor módosítható a `~/.vimrc` fájl szerkesztésével. A változások a Vim újraindítása után vagy `:source ~/.vimrc` parancs futtatása után lépnek érvénybe.
