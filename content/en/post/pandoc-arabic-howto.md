---
title: How to make Arabic PDFs with Markdown and pandoc
type: post
date: 2024-09-19
tags:
  - Computers
categories:
  - Tutorials
params:
  math: true
---

Here's one way to write Arabic articles in Markdown format and typeset them as PDF files, as I've done for [كوكبنا.شبكة](https://كوكبنا.شبكة). This assumes you're using Linux or a similar environment, and are comfortable with the command line.
The basic idea is to to use [pandoc](https://pandoc.org/) to convert the Markown to [\(\rm\LaTeX\)](https://en.wikipedia.org/wiki/LaTeX) markup, and tell pandoc to run [LuaTeX](https://www.luatex.org/) to generate the PDF.

You'll need:

- A Markdown editor that handles Arabic text well. I recommend [Obsidian](https://obsidian.md/), which is user-friendly and has good built-in right-to-left text support. You can add the [Obsidian RTL Plugin](https://github.com/esm7/obsidian-rtl) to get a few improvements.
- A good Arabic font that's convenient for text editing, such as [Noto Naskh Arabic](https://fonts.google.com/noto/specimen/Noto+Naskh+Arabic).
- Some good Arabic fonts for your PDFs, such as [Amiri](https://fonts.google.com/specimen/Amiri) for body text and [Cairo](https://fonts.google.com/specimen/Cairo) for headings.
- The [LuaTeX](https://www.luatex.org/) typesetter, which you can get by installing [TeXlive](https://www.tug.org/texlive/). If you're not sure what you need, just install the whole TeXlive distribution.
- [pandoc](https://pandoc.org/)
- [GNU Make](https://www.gnu.org/software/make/)
- An ordinary text editor for writing Makefiles and the like, such as [Visual Studio Code](https://code.visualstudio.com/).

## Top-level directory

Obsidian expects you to put Markdown files in a directory tree that it configures as a "vault". You can have multiple vaults, but it stores its own configuration and plugins separately in each vault.

Create a directory that will contain Arabic articles. In Obsidian, choose "Open folder as vault" and open the folder you created. This just means that it creates a hidden subdirectory called `.obsidian`; don't put anything in that subdirectory.

I prefer to make a subdirectory for each article, and to keep shared configuration in the top-level directory.

### Shared pandoc variables

In the top-level directory you created, create a file `variables.md`, containing pandoc variables to be used for all the articles.

```yaml
---
documentclass: article
classoption: a4paper
colorlinks: true
indent: true
---
```

### Shared LaTeX formatting

Create a file `header.tex`, containing LaTeX formatting commands to be used for all the articles. Here I'm
following [the advice in the Babel documentation](https://latex3.github.io/babel/guides/which-method-for-which-language.html),
and I've added some commands to make the output look better, by:

- Increasing the default text size (`Scale=1.2`).
- Putting more space between lines (`baselinestretch`).
- Using the `titling` and `titlesec` packages to increase the sizes of titles and headings.


```latex
\usepackage[arabic, provide=*, bidi=basic, layout=counters.tabular]{babel}
\babelfont{rm}[Renderer=Harfbuzz, Scale=1.2]{Amiri}
\babelfont{sf}[Renderer=Harfbuzz, Scale=1.2]{Cairo}
\babelfont{tt}[Renderer=Harfbuzz, Scale=1.2]{DejaVu Sans Mono}

\renewcommand{\baselinestretch}{2}

\usepackage{titling}
\usepackage{titlesec}

\pretitle{
  \begin{center}
    \normalfont\sffamily\Huge
}
\posttitle{
  \end{center}
}

\titleformat{\section}
  {\normalfont\sffamily\large}
  {\thesection}
  {1em}{}[]

\titleformat{\subsection}
  {\normalfont\sffamily}
  {\thesection}
  {1em}{}[]
```

### Shared Makefile rules

Create a file called `rules.mk`, which contains the shared Makefile rules for all the articles:

```makefile
.PHONY: all clean

INPUT = $(wildcard *.md)
OUTPUT = $(patsubst %.md, %.pdf, $(INPUT))

all: $(OUTPUT)

%.pdf: %.md ../header.tex ../variables.md
	pandoc --pdf-engine lualatex --include-in-header ../header.tex -o $@ ../variables.md $<

clean:
	rm -f $(OUTPUT) *~
```

## Articles

For each article, make a subdirectory, e.g. `article-01`, and put the following `Makefile` in it:

```makefile
include ../rules.mk
```

Use Obsidian to write the article in Markdown in the same subdirectory. At the top of the Markdown file, put the pandoc variables that are specific to that article (these are called "properties" in Obsidian), e.g.:

```yaml
---
title: "هذا عنوان المقال"
author: "أنا"
date: "فبراير 2024"
---
```

To generate the PDF, open a terminal, change to the `article-01` directory, and type `make`. Your PDF should be generated in the same directory.
