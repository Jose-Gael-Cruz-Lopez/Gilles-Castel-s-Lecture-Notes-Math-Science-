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

## Setup on macOS (Step by Step)

You already ran `brew install --cask mactex`. Follow every step below in order.

### Step 1: Make LaTeX available in your terminal

MacTeX installs to `/Library/TeX/texbin/` but your shell may not see it yet. **Close your terminal and open a brand new one**, then check:

```bash
pdflatex --version
```

If it prints version info, skip to Step 2. If it says `command not found`, add it to your PATH manually:

```bash
# For zsh (default on modern macOS):
echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# For bash:
echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

Verify everything works:

```bash
pdflatex --version
latexmk --version
```

Both commands should print version information. If `latexmk` is missing, install it:

```bash
sudo tlmgr install latexmk
```

### Step 2: Install Inkscape (for hand-drawn diagrams)

This is optional but needed if you want to draw figures like Castel does.

```bash
brew install --cask inkscape
```

After install, verify:

```bash
inkscape --version
```

### Step 3: Install a PDF viewer that auto-refreshes

When you save your `.tex` file, you want the PDF to update live. The built-in Preview app does NOT do this. Install Skim:

```bash
brew install --cask skim
```

Then configure Skim to auto-reload:
1. Open Skim
2. Go to **Skim > Settings** (or `Cmd+,`)
3. Click the **Sync** tab
4. Check **"Check for file changes"**
5. Select **"Reload automatically"**

### Step 4: Clone this repository

```bash
cd ~/Documents   # or wherever you keep your projects
git clone https://github.com/Jose-Gael-Cruz-Lopez/Gilles-Castel-s-Lecture-Notes-Math-Science-.git
cd Gilles-Castel-s-Lecture-Notes-Math-Science-
```

### Step 5: Compile the template for the first time

```bash
cd course-template
make
```

This runs `pdflatex` twice (needed for table of contents and cross-references). You should see output scrolling by and it should end without errors.

If `make` is not found, install Xcode command line tools first:

```bash
xcode-select --install
```

Then run `make` again.

### Step 6: Open the PDF

```bash
open -a Skim master.pdf
```

You should see a multi-page PDF with definitions, theorems, TikZ diagrams, commutative diagrams, function plots, and vector fields. This is the example lecture.

### Step 7: Start live-editing

Open a second terminal tab/window and run:

```bash
cd ~/Documents/Gilles-Castel-s-Lecture-Notes-Math-Science-/course-template
make watch
```

This watches for file changes and recompiles automatically. Now open a `.tex` file in your editor, make a change, save -- Skim will update within a few seconds.

### Step 8: Personalize the template

1. Open `master.tex` and change `\title`, `\author`, and `\date`
2. Edit `lec_01.tex` (the example lecture) or delete its content and start fresh
3. To add more lectures, create `lec_02.tex`, `lec_03.tex`, etc. and add `\input{lec_02.tex}` lines in `master.tex`
4. Each lecture starts with:
   ```latex
   \lecture{2}{Wed 05 Feb 2025 14:00}{Subgroups and Cosets}
   ```
   This creates a heading and puts the date in the margin.

### Step 9: Create a new course (optional)

To start a separate set of notes for another class:

```bash
cp -r course-template/ my-algebra-course/
cd my-algebra-course/
# Edit master.tex, start writing lec_01.tex
make watch
```

---

## Troubleshooting (macOS)

**`pdflatex: command not found` after installing MacTeX:**
Close ALL terminal windows and open a fresh one. If still broken, run:
```bash
eval "$(/usr/libexec/path_helper)"
```
or add the PATH manually as shown in Step 1.

**`make: command not found`:**
```bash
xcode-select --install
```

**Missing LaTeX package errors (e.g., `! LaTeX Error: File 'stmaryrd.sty' not found`):**
MacTeX Full includes everything, but if you used BasicTeX or something is missing:
```bash
sudo tlmgr update --self
sudo tlmgr install stmaryrd mdframed tcolorbox pgfplots tikz-cd siunitx systeme
```

**Skim not reloading:**
Make sure "Reload automatically" is checked in Skim > Settings > Sync.

**Inkscape export not working:**
Make sure you're using Inkscape 1.0+ (the command-line flags changed from older versions). Check with `inkscape --version`.

---

## Setup on Other Platforms

<details>
<summary><b>Ubuntu/Debian</b></summary>

```bash
sudo apt update
sudo apt install texlive-full latexmk inkscape
cd course-template && make
```
Use Zathura (`sudo apt install zathura`) as your PDF viewer -- it auto-reloads on file change.
</details>

<details>
<summary><b>Fedora</b></summary>

```bash
sudo dnf install texlive-scheme-full latexmk inkscape
cd course-template && make
```
</details>

<details>
<summary><b>Windows</b></summary>

1. Install [MiKTeX](https://miktex.org/download) or [TeX Live](https://tug.org/texlive/windows.html)
2. Make sure `pdflatex` and `latexmk` are on your PATH
3. Install [Inkscape](https://inkscape.org) for figures
4. Use [SumatraPDF](https://www.sumatrapdfreader.org) as your viewer (auto-reloads)
5. Compile: `pdflatex -shell-escape master.tex` (run twice)
</details>

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
