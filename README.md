# LaTeX Lecture Notes Template

A complete LaTeX setup for taking beautiful math/science lecture notes in VS Code, inspired by [Gilles Castel's lecture notes workflow](https://castel.dev/post/lecture-notes-1/).

**What you get:**
- Boxed theorem, definition, lemma, and proposition environments
- Commutative diagrams, function plots, and geometric figures via TikZ
- Inkscape figure integration for hand-drawn diagrams
- Correction boxes, note boxes, and important-highlight boxes
- Fancy headers with lecture number and date in the margin
- Common math shortcuts (`\R`, `\Z`, `\Q`, `\N`, `\C`, `\implies`, etc.)
- Live PDF preview inside VS Code that updates every time you save

---

## macOS Setup (Primary — VS Code)

Follow every step in order. Do not skip any step.

### Step 1: Install Homebrew

Homebrew is the package manager for macOS. Open **Terminal** (press `Cmd + Space`, type `Terminal`, press Enter) and paste:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

It will ask for your Mac password (you won't see characters as you type — that's normal). Press Enter and wait for it to finish.

When it's done, it may print a "Next steps" section telling you to run two commands. **Run those commands.** They look something like:

```bash
echo >> ~/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

Verify Homebrew is installed:

```bash
brew --version
```

It should print something like `Homebrew 4.x.x`. If it says `command not found`, close your terminal, open a new one, and try again.

### Step 2: Install Git

Git lets you download this repository. It may already be installed on your Mac.

```bash
git --version
```

If it prints a version number, skip ahead. If it asks you to install Xcode Command Line Tools, click **Install** in the popup and wait for it to finish. Then run `git --version` again to confirm.

If nothing happened, install it manually:

```bash
xcode-select --install
```

### Step 3: Install MacTeX (the LaTeX compiler)

This is the program that turns `.tex` files into PDFs. It's a large download (~4 GB) so it will take a few minutes.

```bash
brew install --cask mactex
```

Wait for it to finish completely.

**IMPORTANT:** After it finishes, **close your terminal and open a brand new one.** This is required so your shell can find the newly installed LaTeX commands.

In the new terminal, verify:

```bash
pdflatex --version
```

It should print version info like `pdfTeX 3.x...`. If it says `command not found`, run:

```bash
# For zsh (default on modern macOS — your terminal prompt ends with %)
echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.zshrc
source ~/.zshrc

# For bash (your terminal prompt ends with $)
echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```

Then verify again:

```bash
pdflatex --version
latexmk --version
```

Both should print version info. If `latexmk` is missing:

```bash
sudo tlmgr install latexmk
```

### Step 4: Install VS Code

```bash
brew install --cask visual-studio-code
```

After install, open VS Code from your Applications folder (or press `Cmd + Space`, type `Visual Studio Code`, press Enter).

Verify you can open VS Code from the terminal:

```bash
code --version
```

If it says `command not found`:
1. Open VS Code
2. Press `Cmd + Shift + P`
3. Type `shell command`
4. Click **"Shell Command: Install 'code' command in PATH"**
5. Close and reopen your terminal

### Step 5: Install the LaTeX Workshop extension in VS Code

This extension gives you syntax highlighting, auto-compilation, and a built-in PDF viewer.

```bash
code --install-extension James-Yu.latex-workshop
```

Or install it manually:
1. Open VS Code
2. Click the **Extensions** icon in the left sidebar (or press `Cmd + Shift + X`)
3. Search for **"LaTeX Workshop"**
4. Click **Install** on the one by James Yu

### Step 6: Clone this repository

```bash
cd ~/Documents
git clone https://github.com/Jose-Gael-Cruz-Lopez/Gilles-Castel-s-Lecture-Notes-Math-Science-.git
```

### Step 7: Open the project in VS Code

**IMPORTANT:** Do NOT just open a random folder. Open the **workspace file** — this is what makes auto-compilation and PDF preview work:

```bash
open ~/Documents/Gilles-Castel-s-Lecture-Notes-Math-Science-/lecture-notes.code-workspace
```

Or: In Finder, navigate to the cloned folder and **double-click `lecture-notes.code-workspace`**.

VS Code will open with `course-template` as the workspace root and all LaTeX settings pre-configured.

### Step 8: Compile the template for the first time

1. In the sidebar, click on `master.tex` to open it
2. **Press `Cmd + S`** — this triggers compilation automatically
3. You will see a spinning icon in the bottom status bar while it compiles
4. When it finishes (checkmark in the status bar), the PDF is ready

If auto-compilation doesn't trigger, compile from the terminal (press `` Ctrl + ` `` to open it):

```bash
bash -l -c "pdflatex -interaction=nonstopmode -shell-escape master.tex"
bash -l -c "pdflatex -interaction=nonstopmode -shell-escape master.tex"
```

### Step 9: View the PDF inside VS Code

After compilation finishes:

1. With `master.tex` still open, click the **"View LaTeX PDF"** button in the top-right corner of the editor (it looks like a magnifying glass over a page)
2. Or press `Cmd + Shift + P`, type `latex pdf`, and click **"LaTeX Workshop: View LaTeX PDF file"**

The PDF will open in a tab right next to your `.tex` file. **Every time you save (`Cmd + S`), the PDF updates automatically.**

**Recommended layout:** Drag the PDF tab to the right side of the editor so you have `.tex` on the left and PDF on the right.

### Step 10: Personalize the template

1. Open `course-template/master.tex` and change:
   ```latex
   \title{Your Course Title}
   \author{Your Name}
   \date{Spring 2025}
   ```
2. Open `course-template/lec_01.tex` — this is the example lecture. Delete its contents and start writing your own notes, or keep it as a reference.
3. To add a new lecture, create a new file (e.g., `lec_02.tex`) and add this line in `master.tex`:
   ```latex
   \input{lec_02.tex}
   ```
4. Start each lecture file with:
   ```latex
   \lecture{2}{Wed 05 Feb 2025 14:00}{Subgroups and Cosets}
   ```

### Step 11: Install Inkscape (optional — for hand-drawn diagrams)

Only needed if you want to draw figures by hand like Castel does. You can skip this and use TikZ code diagrams only.

```bash
brew install --cask inkscape
```

Verify:

```bash
inkscape --version
```

### Step 12: Create a new course (optional)

To start a separate set of notes for another class, just copy the template folder:

```bash
cp -r ~/Documents/Gilles-Castel-s-Lecture-Notes-Math-Science-/course-template/ ~/Documents/my-algebra-course/
code ~/Documents/my-algebra-course/
```

---

## How to Use This Template (Tutorial)

This section teaches you how to actually write lecture notes. If you've never used LaTeX before, read this whole section.

### Creating a new lecture

Every lecture is a separate `.tex` file. A blank template is included — copy it:

1. In VS Code, right-click in the sidebar and select **New File**
2. Name it `lec_02.tex` (or whatever number you're on)
3. Copy the content from `lec_template.tex` into it
4. Open `master.tex` and add this line before `\end{document}`:
   ```latex
   \input{lec_02.tex}
   ```
5. Edit the lecture header at the top of your new file:
   ```latex
   \lecture{2}{Wed 05 Feb 2025 14:00}{Subgroups and Cosets}
   ```
   - First argument: lecture number
   - Second argument: date (shown in the margin)
   - Third argument: topic title (shown as a heading)

That's it. Press `Cmd + S` and the PDF updates with your new lecture.

### Writing math

**Inline math** — wrap with `$...$`:
```latex
The function $f(x) = x^2 + 3x + 1$ has roots at $x = \frac{-3 \pm \sqrt{5}}{2}$.
```

**Display math** (centered on its own line) — wrap with `\[...\]`:
```latex
\[
    \int_0^\infty e^{-x^2} \, dx = \frac{\sqrt{\pi}}{2}
\]
```

**Numbered equations** (so you can reference them later):
```latex
\begin{align}
    E &= mc^2 \label{eq:einstein} \\
    F &= ma \label{eq:newton}
\end{align}
As shown in Equation~\eqref{eq:einstein}, ...
```

### Common math syntax cheat sheet

| What you want | What you type |
|---|---|
| Fraction | `\frac{a}{b}` |
| Square root | `\sqrt{x}` or `\sqrt[3]{x}` |
| Exponent | `x^2` or `x^{10}` |
| Subscript | `x_1` or `x_{ij}` |
| Greek letters | `\alpha`, `\beta`, `\gamma`, `\delta`, `\epsilon`, `\theta`, `\lambda`, `\pi`, `\sigma`, `\omega` |
| Capital Greek | `\Gamma`, `\Delta`, `\Theta`, `\Lambda`, `\Pi`, `\Sigma`, `\Omega` |
| Infinity | `\infty` |
| Sum | `\sum_{i=1}^{n}` |
| Product | `\prod_{i=1}^{n}` |
| Integral | `\int_a^b` or `\iint` or `\iiint` |
| Limit | `\lim_{x \to 0}` |
| Partial derivative | `\frac{\partial f}{\partial x}` |
| Vector | `\vec{v}` or `\mathbf{v}` |
| Matrix | `\begin{pmatrix} a & b \\ c & d \end{pmatrix}` |
| Dots | `\ldots` (low), `\cdots` (center), `\vdots` (vertical), `\ddots` (diagonal) |
| Set notation | `\{1, 2, 3\}` (use `\{` and `\}` for curly braces) |
| Element of | `x \in S` |
| Subset | `A \subset B` or `A \subseteq B` |
| Union/intersection | `A \cup B`, `A \cap B` |
| Not equal | `\neq` |
| Less/greater equal | `\leq`, `\geq` |
| Approximately | `\approx` |
| Arrow | `\to` or `\rightarrow`, `\mapsto` |
| Implies | `\implies` (double arrow, already shortened in this template) |
| If and only if | `\iff` |
| For all / exists | `\forall`, `\exists` |
| Blackboard bold | `\R` (reals), `\Z` (integers), `\Q` (rationals), `\N` (naturals), `\C` (complex) |

### Using environments

Environments are the boxed/labeled blocks for definitions, theorems, etc. The format is always:

```latex
\begin{environmentname}
    Content goes here.
\end{environmentname}
```

**Definition** (boxed, numbered):
```latex
\begin{definition}
    A \textbf{metric space} is a set $X$ together with a function
    $d : X \times X \to \R$ satisfying:
    \begin{enumerate}
        \item $d(x,y) \geq 0$ and $d(x,y) = 0 \iff x = y$
        \item $d(x,y) = d(y,x)$
        \item $d(x,z) \leq d(x,y) + d(y,z)$
    \end{enumerate}
\end{definition}
```

**Theorem + Proof**:
```latex
\begin{theorem}
    Every convergent sequence is bounded.
\end{theorem}

\begin{proof}
    Let $(a_n)$ converge to $L$. Then there exists $N$ such that
    for all $n > N$, $|a_n - L| < 1$, so $|a_n| < |L| + 1$.
    Let $M = \max\{|a_1|, \ldots, |a_N|, |L| + 1\}$.
    Then $|a_n| \leq M$ for all $n$.
\end{proof}
```

**Example** (ends with a diamond):
```latex
\begin{eg}
    The sequence $a_n = 1/n$ converges to $0$.
\end{eg}
```

**Other environments you can use** (same `\begin{...}` / `\end{...}` syntax):

| Environment | What it's for |
|---|---|
| `definition` | Definitions (boxed, numbered) |
| `theorem` | Theorems (boxed, numbered) |
| `lemma` | Lemmas (boxed, numbered) |
| `corollary` | Corollaries (boxed, numbered) |
| `prop` | Propositions (boxed, numbered) |
| `axiom` | Axioms (boxed, numbered) |
| `conjecture` | Conjectures (boxed, numbered) |
| `proof` | Proofs (ends with QED square) |
| `eg` | Examples (ends with diamond) |
| `remark` | Remarks |
| `note` | Notes |
| `notation` | Notation explanations |
| `intuition` | Intuitive explanations |
| `recall` | Recalling previous results |
| `exercise` | Exercises |
| `problem` | Problems |

**Special colored boxes**:
```latex
\begin{correction}
    Last lecture I said X. That was wrong. It should be Y.
\end{correction}

\begin{notebox}{Warning}
    Don't confuse continuity with uniform continuity.
\end{notebox}

\begin{important}{Key Result}
    This theorem is used in every proof for the rest of the course.
\end{important}
```

### Sections and structure

Use `\section{}` and `\subsection{}` to organize within a lecture:

```latex
\lecture{3}{Fri 07 Feb 2025 10:00}{Continuity}

\section{Definition of Continuity}

Text here...

\subsection{Epsilon-Delta Definition}

Text here...

\section{Properties of Continuous Functions}

Text here...
```

### Lists

**Numbered list:**
```latex
\begin{enumerate}
    \item First item
    \item Second item
    \item Third item
\end{enumerate}
```

**Bullet list:**
```latex
\begin{itemize}
    \item First point
    \item Second point
\end{itemize}
```

### Bold, italic, and emphasis

```latex
\textbf{bold text}
\textit{italic text}
\emph{emphasized text}   % italic in normal text, upright in italic context
```

### Adding a simple TikZ diagram inline

```latex
Here is a triangle:
\begin{center}
\begin{tikzpicture}
    \draw (0,0) -- (3,0) -- (1.5,2) -- cycle;
    \node[below] at (1.5,0) {base};
\end{tikzpicture}
\end{center}
```

### Full example: a real lecture

Here's what a real lecture file looks like:

```latex
\lecture{5}{Wed 12 Feb 2025 10:00}{Sequences and Series}

\section{Sequences}

\begin{definition}
    A \textbf{sequence} in $\R$ is a function $a : \N \to \R$.
    We write $(a_n)_{n=1}^{\infty}$ or simply $(a_n)$.
\end{definition}

\begin{definition}
    A sequence $(a_n)$ \textbf{converges} to $L \in \R$ if for every
    $\epsilon > 0$ there exists $N \in \N$ such that
    \[
        n > N \implies |a_n - L| < \epsilon.
    \]
    We write $\lim_{n \to \infty} a_n = L$ or $a_n \to L$.
\end{definition}

\begin{eg}
    Let $a_n = \frac{1}{n}$. We claim $a_n \to 0$.

    Given $\epsilon > 0$, choose $N > \frac{1}{\epsilon}$.
    Then for $n > N$:
    \[
        |a_n - 0| = \frac{1}{n} < \frac{1}{N} < \epsilon. \qedhere
    \]
\end{eg}

\begin{theorem}
    Every convergent sequence is bounded.
\end{theorem}

\begin{proof}
    Let $a_n \to L$. Choose $N$ such that $|a_n - L| < 1$ for all $n > N$.
    Then $|a_n| < |L| + 1$ for $n > N$.
    Set $M = \max\{|a_1|, \ldots, |a_N|, |L| + 1\}$.
    Then $|a_n| \leq M$ for all $n$.
\end{proof}

\begin{remark}
    The converse is false: $a_n = (-1)^n$ is bounded but does not converge.
\end{remark}

\section{Series}

\begin{definition}
    Given a sequence $(a_n)$, the \textbf{series} $\sum_{n=1}^{\infty} a_n$
    is defined as the limit of partial sums:
    \[
        \sum_{n=1}^{\infty} a_n = \lim_{N \to \infty} \sum_{n=1}^{N} a_n
    \]
    provided the limit exists.
\end{definition}

\begin{important}{Divergence Test}
    If $\sum a_n$ converges, then $a_n \to 0$.
    Equivalently: if $a_n \not\to 0$, then $\sum a_n$ diverges.
\end{important}
```

---

## VS Code Settings (Already Included)

This repository includes **three layers of protection** so compilation always works:

1. **`lecture-notes.code-workspace`** — a workspace file at the repo root. Opening this file (Step 7) is the recommended way to use this project. It sets the correct working directory and all LaTeX settings.
2. **`course-template/.vscode/settings.json`** — if you open the `course-template/` folder directly, this file configures LaTeX Workshop.
3. **`.vscode/settings.json`** — if you open the repo root folder directly, this file configures LaTeX Workshop.

All three use `bash -l -c "pdflatex ..."` instead of calling `pdflatex` directly. The `-l` flag makes bash load your login profile, which includes the LaTeX PATH. This works on **macOS, Linux, and Windows (Git Bash)** with zero configuration.

---

## Troubleshooting (macOS)

**`spawn pdflatex ENOENT` or `spawn latexmk ENOENT` in VS Code:**
This means VS Code cannot find `pdflatex`. Fix it by opening the **workspace file** instead of a folder:
```bash
open ~/Documents/Gilles-Castel-s-Lecture-Notes-Math-Science-/lecture-notes.code-workspace
```
Or in Finder, double-click `lecture-notes.code-workspace`. If you still get the error:
1. Check that MacTeX is installed: open Terminal and run `/Library/TeX/texbin/pdflatex --version`
2. If it says `No such file or directory`, reinstall: `brew install --cask mactex`
3. Restart VS Code completely (`Cmd + Q`, then reopen the workspace file)

**`pdflatex: command not found` in the terminal:**
Close ALL terminal windows and open a fresh one. If still broken:
```bash
eval "$(/usr/libexec/path_helper)"
```
or add the PATH manually as shown in Step 3.

**`make: command not found`:**
```bash
xcode-select --install
```

**`brew: command not found`:**
You skipped Step 1. Go back and install Homebrew.

**Text is tiny and doesn't fill the page:**
The template uses `letterpaper` with 1-inch margins. If you see small centered text, you have an old version. Re-clone or `git pull`.

**Missing LaTeX package errors (e.g., `! LaTeX Error: File 'stmaryrd.sty' not found`):**
MacTeX Full includes everything, but if something is missing:
```bash
sudo tlmgr update --self
sudo tlmgr install stmaryrd mdframed tcolorbox pgfplots tikz-cd siunitx systeme geometry
```

**PDF not showing in VS Code:**
Press `Cmd + Shift + P`, type `latex pdf`, and click **"LaTeX Workshop: View LaTeX PDF file"**.

**Inkscape export not working:**
Make sure you're using Inkscape 1.0+. Check with `inkscape --version`.

---

## Windows Setup (VS Code)

### Step 1: Install MiKTeX (LaTeX compiler)

1. Go to [https://miktex.org/download](https://miktex.org/download)
2. Download the Windows installer
3. Run the installer. When asked, select **"Install missing packages on-the-fly: Yes"**
4. Finish the installation

### Step 2: Install Perl (required by latexmk)

1. Go to [https://strawberryperl.com/](https://strawberryperl.com/)
2. Download and install the latest version
3. Restart your computer after installing

### Step 3: Install latexmk

Open **Command Prompt** or **PowerShell** and run:

```bash
miktex-console
```

This opens the MiKTeX Console. Go to **Packages**, search for `latexmk`, and install it. Then close the console.

Or from the command line:

```bash
mpm --install=latexmk
```

Verify:

```bash
pdflatex --version
latexmk --version
```

### Step 4: Install Git

1. Go to [https://git-scm.com/download/win](https://git-scm.com/download/win)
2. Download and install. Use all the default options.
3. Restart your terminal after installing.

Verify:

```bash
git --version
```

### Step 5: Install VS Code

1. Go to [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Download and install the Windows version
3. Open VS Code

### Step 6: Install LaTeX Workshop extension

1. Open VS Code
2. Press `Ctrl + Shift + X` to open Extensions
3. Search for **"LaTeX Workshop"** by James Yu
4. Click **Install**

### Step 7: Clone this repository

Open a terminal in VS Code (`Ctrl + ~`) and run:

```bash
cd %USERPROFILE%\Documents
git clone https://github.com/Jose-Gael-Cruz-Lopez/Gilles-Castel-s-Lecture-Notes-Math-Science-.git
```

Then open the workspace file — this auto-configures everything:

```bash
code "%USERPROFILE%\Documents\Gilles-Castel-s-Lecture-Notes-Math-Science-\lecture-notes.code-workspace"
```

### Step 8: Compile and view

1. Open `master.tex` in the sidebar
2. Press `Ctrl + S` to compile
3. Press `Ctrl + Shift + P`, type `latex pdf`, click **"LaTeX Workshop: View LaTeX PDF file"**
4. The PDF opens in a side tab. It updates automatically on every save.

### Step 9: Install Inkscape (optional)

Download from [https://inkscape.org/release/](https://inkscape.org/release/) and install.

### Troubleshooting (Windows)

**`pdflatex is not recognized`:**
Make sure MiKTeX's `bin` folder is on your PATH. Open System Properties > Environment Variables > Path and add `C:\Program Files\MiKTeX\miktex\bin\x64\` (or wherever MiKTeX installed).

**Missing packages:**
If MiKTeX asks to install packages, click **Yes/Install**. You set "install on-the-fly" during setup, so this should be automatic.

**`latexmk is not recognized`:**
Make sure you installed Strawberry Perl (Step 2) and latexmk (Step 3). Restart your terminal.

---

## Ubuntu/Debian Setup (VS Code)

### Step 1: Update your system

Open a terminal (`Ctrl + Alt + T`) and run:

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install LaTeX

```bash
sudo apt install -y texlive-full latexmk
```

This is a large download (~3-5 GB). Wait for it to finish.

Verify:

```bash
pdflatex --version
latexmk --version
```

### Step 3: Install Git

```bash
sudo apt install -y git
```

Verify:

```bash
git --version
```

### Step 4: Install VS Code

```bash
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code
```

Or download from [https://code.visualstudio.com/](https://code.visualstudio.com/).

### Step 5: Install LaTeX Workshop extension

```bash
code --install-extension James-Yu.latex-workshop
```

### Step 6: Clone this repository

```bash
cd ~/Documents
git clone https://github.com/Jose-Gael-Cruz-Lopez/Gilles-Castel-s-Lecture-Notes-Math-Science-.git
```

### Step 7: Open, compile, and view

Open the workspace file (this auto-configures LaTeX Workshop):

```bash
code ~/Documents/Gilles-Castel-s-Lecture-Notes-Math-Science-/lecture-notes.code-workspace
```

Then:
1. Open `master.tex` in the sidebar
2. Press `Ctrl + S` to compile
3. Press `Ctrl + Shift + P`, type `latex pdf`, click **"LaTeX Workshop: View LaTeX PDF file"**

### Step 8: Install Inkscape (optional)

```bash
sudo apt install -y inkscape
```

---

## File Structure

```
.
├── lecture-notes.code-workspace  # Double-click this to open in VS Code (recommended)
├── .vscode/settings.json        # VS Code settings (backup if workspace file not used)
├── README.md
└── course-template/
    ├── .vscode/settings.json    # VS Code settings (if you open this folder directly)
    ├── master.tex               # Main document — compile this file
    ├── preamble.tex             # All packages, macros, and environments
    ├── lec_01.tex               # Lecture 1 (example with all features)
    ├── lec_template.tex         # Blank template — copy this for new lectures
    ├── build.sh                 # Standalone compile script (macOS/Linux)
    ├── figures/                 # Place Inkscape SVGs here
    │   └── .gitkeep
    ├── Makefile                 # make / make watch / make clean / make figures
    ├── .latexmkrc               # latexmk configuration
    └── .gitignore               # Ignores build artifacts
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

There are two ways to create diagrams: TikZ (code you type in your `.tex` file) and Inkscape (visual drawing tool). You can use either or both.

### Option 1: TikZ (code-based diagrams)

TikZ diagrams live directly in your `.tex` files. The template preloads all common TikZ libraries. Full working examples are in `lec_01.tex`.

**Function plot:**
```latex
\begin{center}
\begin{tikzpicture}
    \begin{axis}[
        axis lines=middle,
        xlabel={$x$}, ylabel={$y$},
        domain=-2:2, samples=100,
    ]
        \addplot[blue, thick]{x^2};
    \end{axis}
\end{tikzpicture}
\end{center}
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
\begin{center}
\begin{tikzpicture}
    \coordinate (A) at (0,0);
    \coordinate (B) at (4,0);
    \coordinate (C) at (1.5,3);
    \draw[thick] (A) -- (B) -- (C) -- cycle;
    \node[below left] at (A) {$A$};
    \node[below right] at (B) {$B$};
    \node[above] at (C) {$C$};
\end{tikzpicture}
\end{center}
```

**Vector field:**
```latex
\begin{center}
\begin{tikzpicture}
    \foreach \x in {-2,-1,0,1,2} {
        \foreach \y in {-2,-1,0,1,2} {
            \pgfmathsetmacro{\vx}{-\y*0.3}
            \pgfmathsetmacro{\vy}{\x*0.3}
            \draw[->, blue] (\x,\y) -- +(\vx,\vy);
        }
    }
    \draw[thick, ->] (-3,0) -- (3,0) node[right] {$x$};
    \draw[thick, ->] (0,-3) -- (0,3) node[above] {$y$};
\end{tikzpicture}
\end{center}
```

### Option 2: Inkscape (hand-drawn diagrams)

This is Castel's preferred method for complex figures drawn during lectures. You draw in Inkscape (a free vector graphics app), and the text in your figures is rendered by LaTeX so the fonts match your document.

#### How it works

1. **Draw** your figure in Inkscape and save it as `figures/my-diagram.svg`
2. **Export** it to PDF+LaTeX (this creates two files: `my-diagram.pdf` for the graphics and `my-diagram.pdf_tex` for the text)
3. **Include** it in your lecture file with the `\incfig` command

#### Exporting from Inkscape

Export a single figure from the terminal:

```bash
inkscape figures/my-diagram.svg \
    --export-area-drawing \
    --export-dpi 300 \
    --export-type=pdf \
    --export-latex \
    --export-filename=figures/my-diagram.pdf
```

Or export all figures at once:

```bash
make figures
```

#### Including in your lecture file

```latex
\begin{figure}[ht]
    \centering
    \incfig{my-diagram}
    \caption{My hand-drawn diagram.}
    \label{fig:my-diagram}
\end{figure}
```

#### Tips for Inkscape figures

- Type LaTeX math directly in Inkscape text objects (e.g., `$\alpha$`, `$\int_0^1 f(x)\,dx$`). The export process makes LaTeX render this text, so fonts match your document perfectly.
- Keep filenames lowercase with hyphens: `riemann-surface.svg`, `group-action.svg`.
- The `\incfig{name}` command looks in `./figures/` for `name.pdf_tex`.
- Install `pip install inkscape-figures` for a helper tool that automates creating and opening figures.

---

## VS Code Snippets for Fast Note-Taking

Snippets let you type a short trigger (like `thm`) and expand it into a full LaTeX environment. In VS Code:

1. Press `Cmd + Shift + P` (macOS) or `Ctrl + Shift + P` (Windows/Linux)
2. Type `snippets` and click **"Snippets: Configure User Snippets"**
3. Select **"latex"** (or "latex.json")
4. Paste the following snippets inside the `{}`:

```json
{
    "Definition": {
        "prefix": "def",
        "body": [
            "\\begin{definition}",
            "\t$0",
            "\\end{definition}"
        ],
        "description": "Definition environment"
    },
    "Theorem": {
        "prefix": "thm",
        "body": [
            "\\begin{theorem}",
            "\t$0",
            "\\end{theorem}"
        ],
        "description": "Theorem environment"
    },
    "Proof": {
        "prefix": "prf",
        "body": [
            "\\begin{proof}",
            "\t$0",
            "\\end{proof}"
        ],
        "description": "Proof environment"
    },
    "Lemma": {
        "prefix": "lem",
        "body": [
            "\\begin{lemma}",
            "\t$0",
            "\\end{lemma}"
        ],
        "description": "Lemma environment"
    },
    "Example": {
        "prefix": "eg",
        "body": [
            "\\begin{eg}",
            "\t$0",
            "\\end{eg}"
        ],
        "description": "Example environment"
    },
    "Remark": {
        "prefix": "rmk",
        "body": [
            "\\begin{remark}",
            "\t$0",
            "\\end{remark}"
        ],
        "description": "Remark environment"
    },
    "Fraction": {
        "prefix": "frac",
        "body": "\\frac{$1}{$2}$0",
        "description": "Fraction"
    },
    "Align": {
        "prefix": "ali",
        "body": [
            "\\begin{align}",
            "\t$0",
            "\\end{align}"
        ],
        "description": "Align environment"
    },
    "Figure (Inkscape)": {
        "prefix": "fig",
        "body": [
            "\\begin{figure}[ht]",
            "\t\\centering",
            "\t\\incfig{$1}",
            "\t\\caption{$2}",
            "\t\\label{fig:$1}",
            "\\end{figure}"
        ],
        "description": "Inkscape figure"
    },
    "TikZ Picture": {
        "prefix": "tikz",
        "body": [
            "\\begin{center}",
            "\\begin{tikzpicture}",
            "\t$0",
            "\\end{tikzpicture}",
            "\\end{center}"
        ],
        "description": "TikZ picture"
    },
    "Lecture Header": {
        "prefix": "lec",
        "body": "\\lecture{$1}{$2}{$3}",
        "description": "Lecture header"
    },
    "New Lecture File": {
        "prefix": "newlec",
        "body": [
            "\\lecture{${1:1}}{${2:Mon 03 Feb 2025 10:00}}{${3:Topic}}",
            "",
            "\\section{${4:First Section}}",
            "",
            "$0"
        ],
        "description": "New lecture file starter"
    }
}
```

Now when you type `thm` and press `Tab`, it expands into a full theorem environment. Type `def` + `Tab` for a definition, `tikz` + `Tab` for a TikZ picture, etc.

---

## Acknowledgments

This template is adapted from [Gilles Castel's university setup](https://github.com/gillescastel/university-setup). His blog posts explain the full workflow in detail:

- [Lecture notes 1: LaTeX snippets](https://castel.dev/post/lecture-notes-1/)
- [Lecture notes 2: Inkscape figures](https://castel.dev/post/lecture-notes-2/)
- [Lecture notes 3: document structure](https://castel.dev/post/lecture-notes-3/)
