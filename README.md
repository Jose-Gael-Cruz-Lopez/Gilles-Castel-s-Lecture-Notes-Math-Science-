# LaTeX Lecture Notes Template

A complete LaTeX setup for taking beautiful math/science lecture notes, inspired by [Gilles Castel's lecture notes workflow](https://castel.dev/post/lecture-notes-1/).

This template gives you:
- Boxed theorem/definition/lemma/proposition environments
- Commutative diagrams, function plots, and geometric figures via TikZ
- Inkscape figure integration for hand-drawn diagrams
- Correction boxes, note boxes, and important-highlight boxes
- Fancy headers with lecture number and date in the margin
- Common math shortcuts (`\R`, `\Z`, `\Q`, `\N`, `\C`, `\implies`, etc.)

---

## Quick Start

### 1. Install LaTeX

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install texlive-full latexmk
```

**Fedora:**
```bash
sudo dnf install texlive-scheme-full latexmk
```

**macOS (via Homebrew):**
```bash
brew install --cask mactex
```
After installing, open a new terminal so `pdflatex` and `latexmk` are on your PATH.

**Windows:**
Install [MiKTeX](https://miktex.org/download) or [TeX Live](https://tug.org/texlive/windows.html). Make sure `pdflatex` and `latexmk` are available in your terminal.

**Verify installation:**
```bash
pdflatex --version
latexmk --version
```

### 2. Compile the Template

```bash
cd course-template

# Single compilation (run twice for TOC/references)
make

# OR compile manually
pdflatex -shell-escape master.tex
pdflatex -shell-escape master.tex

# OR use latexmk for auto-recompilation on save
make watch
# (this watches for file changes and recompiles automatically)
```

The output is `master.pdf` in the `course-template/` directory.

### 3. Start Taking Notes

1. Open `master.tex` and change the `\title`, `\author`, and `\date`.
2. Edit `lec_01.tex` or create new lecture files (`lec_02.tex`, `lec_03.tex`, ...).
3. Add `\input{lec_02.tex}` lines in `master.tex`.
4. Each lecture file starts with:
   ```latex
   \lecture{2}{Wed 05 Feb 2025 14:00}{Subgroups and Cosets}
   ```
   This creates a section heading and puts the date in the margin.

---

## File Structure

```
course-template/
├── master.tex          # Main document — compile this
├── preamble.tex        # All packages, macros, environments
├── lec_01.tex          # Lecture 1 (example with all features)
├── figures/            # Place Inkscape SVGs here
│   └── .gitkeep
├── Makefile            # make / make watch / make clean / make figures
├── .latexmkrc          # latexmk configuration
└── .gitignore           # Ignores build artifacts
```

**To create a new course**, copy the entire `course-template/` directory:
```bash
cp -r course-template/ my-algebra-course/
cd my-algebra-course/
# Edit master.tex, start writing lec_01.tex, etc.
```

---

## Available Environments

### Boxed (numbered) environments

These render inside a frame and are auto-numbered per section:

```latex
\begin{definition}
    A \textbf{group} is a set $G$ with a binary operation...
\end{definition}

\begin{theorem}
    Every finite group of prime order is cyclic.
\end{theorem}

\begin{lemma} ... \end{lemma}
\begin{corollary} ... \end{corollary}
\begin{prop} ... \end{prop}
\begin{axiom} ... \end{axiom}
\begin{conjecture} ... \end{conjecture}
```

### Non-boxed (unnumbered) environments

```latex
\begin{eg} An example (ends with a diamond). \end{eg}
\begin{remark} A side note. \end{remark}
\begin{note} ... \end{note}
\begin{notation} ... \end{notation}
\begin{intuition} ... \end{intuition}
\begin{recall} ... \end{recall}
\begin{observe} ... \end{observe}
\begin{property} ... \end{property}
\begin{exercise} ... \end{exercise}
\begin{problem} ... \end{problem}
```

### Special boxes

```latex
% Green-bordered correction box
\begin{correction}
    We previously stated X, but actually Y.
\end{correction}

% Gray-bordered note box with custom title
\begin{notebox}{Remember}
    Important context here.
\end{notebox}

% Red-bordered important box with custom title
\begin{important}{Key Theorem}
    This result is used throughout the rest of the course.
\end{important}
```

---

## Math Shortcuts

| Command       | Output                     |
|---------------|----------------------------|
| `\N`          | Naturals (blackboard N)    |
| `\Z`          | Integers (blackboard Z)    |
| `\Q`          | Rationals (blackboard Q)   |
| `\R`          | Reals (blackboard R)       |
| `\C`          | Complex (blackboard C)     |
| `\F`          | Finite field (blackboard F)|
| `\O`          | Empty set                  |
| `\implies`    | Double right arrow         |
| `\impliedby`  | Double left arrow          |
| `\iff`        | Double left-right arrow    |
| `\contra`     | Lightning bolt (contradiction) |
| `\correct{wrong}{right}` | Red strikethrough + green correction |

---

## Diagrams

### Option 1: TikZ (programmatic, in-line)

TikZ diagrams live directly in your `.tex` files. The template preloads common TikZ libraries. Examples are in `lec_01.tex`.

**Function plot:**
```latex
\begin{tikzpicture}
    \begin{axis}[
        axis lines=middle,
        xlabel={$x$}, ylabel={$y$},
        domain=-2:2, samples=100,
    ]
        \addplot[blue, thick]{x^2};
    \end{axis}
\end{tikzpicture}
```

**Commutative diagram:**
```latex
\[
    \begin{tikzcd}
        A \arrow[r, "f"] \arrow[d, "g"'] & B \arrow[d, "h"] \\
        C \arrow[r, "k"']                & D
    \end{tikzcd}
\]
```

**Geometric figure:**
```latex
\begin{tikzpicture}
    \coordinate (A) at (0,0);
    \coordinate (B) at (4,0);
    \coordinate (C) at (1.5,3);
    \draw[thick] (A) -- (B) -- (C) -- cycle;
\end{tikzpicture}
```

**Vector field:**
```latex
\begin{tikzpicture}
    \foreach \x in {-2,-1,0,1,2} {
        \foreach \y in {-2,-1,0,1,2} {
            \pgfmathsetmacro{\vx}{-\y*0.3}
            \pgfmathsetmacro{\vy}{\x*0.3}
            \draw[->, blue] (\x,\y) -- +(\vx,\vy);
        }
    }
\end{tikzpicture}
```

### Option 2: Inkscape (hand-drawn, visual)

This is Castel's preferred method for complex figures drawn during lectures. It produces SVG figures with LaTeX-rendered text.

#### Setup

1. **Install Inkscape:**
   ```bash
   # Ubuntu/Debian
   sudo apt install inkscape

   # macOS
   brew install --cask inkscape

   # Windows: download from https://inkscape.org
   ```

2. **Install the figure manager** (optional but recommended):
   ```bash
   pip install inkscape-figures
   ```

#### Workflow

1. **Create a figure** in Inkscape and save as `figures/my-diagram.svg`.

2. **Export to PDF+LaTeX** (so LaTeX renders the text):
   ```bash
   # Single figure
   inkscape figures/my-diagram.svg \
       --export-area-drawing \
       --export-dpi 300 \
       --export-type=pdf \
       --export-latex \
       --export-filename=figures/my-diagram.pdf

   # All figures at once
   make figures
   ```
   This produces `my-diagram.pdf` (graphics) and `my-diagram.pdf_tex` (text positioning).

3. **Include in your lecture file:**
   ```latex
   \begin{figure}[ht]
       \centering
       \incfig{my-diagram}
       \caption{My hand-drawn diagram.}
       \label{fig:my-diagram}
   \end{figure}
   ```

#### Tips for Inkscape figures

- Use **LaTeX math** in text objects (e.g., type `$\alpha$` in Inkscape).
  The `--export-latex` flag makes LaTeX render this text, so fonts match.
- Keep filenames lowercase with hyphens: `riemann-surface.svg`.
- The `\incfig` command looks in `./figures/` for the `.pdf_tex` file.

---

## Tips for Fast Note-Taking

### Editor integration

Castel used Vim with [vimtex](https://github.com/lervag/vimtex) and [UltiSnips](https://github.com/SirVer/ultisnips) for snippet expansion. The same approach works with:

- **Vim/Neovim:** vimtex + UltiSnips or LuaSnip
- **VS Code:** [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension with custom snippets
- **Emacs:** AUCTeX + YASnippet

### Example snippets (UltiSnips syntax)

```
# Fraction: type "// " to get \frac{}{}
snippet // "Fraction" iA
\\frac{$1}{$2}$0
endsnippet

# Subscript: type "x1" to get x_1
snippet '([A-Za-z])(\d)' "auto subscript" wrA
`!p snip.rv = match.group(1)`_`!p snip.rv = match.group(2)`
endsnippet

# Environment: type "beg" to get \begin{}...\end{}
snippet beg "begin/end environment" bA
\\begin{$1}
    $0
\\end{$1}
endsnippet

# Definition: type "def" to get definition environment
snippet def "Definition" bA
\\begin{definition}
    $0
\\end{definition}
endsnippet

# Theorem: type "thm" to get theorem environment
snippet thm "Theorem" bA
\\begin{theorem}
    $0
\\end{theorem}
endsnippet
```

See [Castel's full snippet list](https://castel.dev/post/lecture-notes-1/) for 100+ more.

### Compilation workflow

Use `make watch` (or `latexmk -pdf -pvc master.tex`) to auto-recompile on save. Pair this with a PDF viewer that auto-refreshes:

- **Linux:** Zathura (`zathura master.pdf`) — reloads on file change
- **macOS:** Skim (set to auto-reload in preferences)
- **VS Code:** LaTeX Workshop's built-in PDF viewer

### Recommended layout

Split your screen: editor on the left, PDF viewer on the right. As you type and save, the PDF updates in real time.

---

## Acknowledgments

This template is adapted from [Gilles Castel's university setup](https://github.com/gillescastel/university-setup). His blog posts explain the full workflow in detail:

- [Lecture notes 1: snippets](https://castel.dev/post/lecture-notes-1/)
- [Lecture notes 2: Inkscape figures](https://castel.dev/post/lecture-notes-2/)
- [Lecture notes 3: document structure](https://castel.dev/post/lecture-notes-3/)
