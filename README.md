# SmallReSiever

RSS reader for GNUStep using the [SmallStep](../SmallStepLib) API and [libxml2](https://gitlab.gnome.org/GNOME/libxml2) (FOSS).

## Project layout

```
SmallReSiever/
├── App/              # Application entry and UI
│   ├── main.m
│   ├── AppDelegate.h
│   └── AppDelegate.m
├── RSS/              # RSS/Atom models and parsing
│   ├── RSSFeed.h/m
│   ├── RSSItem.h/m
│   └── RSSParser.h/m
├── GNUmakefile
├── LICENSE
└── README.md
```

## Open source libraries (RSS reading)

RSS/Atom reading is implemented using:

| Library   | Role                    | License   |
|----------|--------------------------|-----------|
| **libxml2** | XML parsing (RSS 2.0 and Atom 1.0) | MIT       |

- **libxml2**: [https://gitlab.gnome.org/GNOME/libxml2](https://gitlab.gnome.org/GNOME/libxml2) — C library for parsing XML; used in `RSS/RSSParser.m` to parse feed XML and populate `RSSFeed` / `RSSItem`. No other third‑party RSS/XML libraries are used.

The app also uses **GNUStep** (Base + GUI) for the desktop UI and the **SmallStep** API from [../SmallStepLib](../SmallStepLib) (app lifecycle, menus, about panel, window style, concurrency).

## Features

- Fetch RSS 2.0 and Atom 1.0 feeds from any HTTP(S) URL
- Parse feeds with libxml2 (C, free software)
- List items in a table; show title, link, date, and content in a text view
- Add Feed (Cmd+O) and Refresh (Cmd+R); Quit (Cmd+Q)
- Feed fetching runs on a background thread so the UI stays responsive

## Dependencies

- **GNUStep** (Base + GUI): `gnustep-base`, `gnustep-gui`, `gnustep-make`
- **libxml2**: `libxml2-dev` (or equivalent)

SmallReSiever links against the shared **SmallStep** framework from SmallStepLib (build it first).

## Build

```bash
cd ../SmallStepLib && make
cd ../ReSiever
. /usr/share/GNUstep/Makefiles/GNUstep.sh   # or your GNUSTEP.sh path
make
```

## Run

```bash
./SmallReSiever.app/SmallReSiever
# or
openapp ./SmallReSiever.app
```

Enter a feed URL (e.g. `https://www.example.com/feed.xml`) and click **Fetch**. Select an item in the list to view its content.

## License

GNU AGPLv3+. See [LICENSE](LICENSE).
