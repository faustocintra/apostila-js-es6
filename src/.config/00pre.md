---
title:  |
        | ![](../.artwork/cover.png){width=10cm}  
        | Apostila de JavaScript (ES6+)
subtitle: |
          | Nível básico
          |
          | [![](../.artwork/cc-by-nc.png){width=3cm}](https://creativecommons.org/licenses/by-nc/4.0/deed.pt_BR)

author: |
        | Prof. Fausto G. Cintra
        | (<professor@faustocintra.com.br>)
version: 0.1
toc-title: Sumário
numbersections: True
figureTitle: Figura
figPrefix: Figura
listingTitle: Listagem
lstPrefix: Listagem
tableTitle: Tabela
tblPrefix: Tabela
urlcolor: RedOrange
papersize: a4
linestretch: 1.2
lang: pt-BR
documentclass: report
geometry: "left=3cm,right=2cm,top=3cm,bottom=2cm"
mainfont: Rambla
monofont: Iosevka Booklet
# monofontoptions: 'Scale=0.9'
fontsize: 12pt
header-includes: |
    \usepackage{float}
    \usepackage{listingsutf8}
    \usepackage{fancyhdr}
    \setlength\parindent{30pt}
    \usepackage{indentfirst}
    \pagestyle{fancy}
    \fancyhead[L]{APOSTILA JS (ES6+)}
    \fancyhead[C]{Prof. Fausto G. Cintra}
    \fancyhead[R]{\thepage}
    \fancyfoot[L,C,R]{}
    
    \usepackage{tcolorbox}
    \newtcolorbox{myquote}{colback=gray!5!white, colframe=gray!20!white}
    \renewenvironment{quote}{\begin{myquote}}{\end{myquote}}

    \usepackage{fvextra}
    \DefineVerbatimEnvironment{Highlighting}{Verbatim}{breaklines,commandchars=\\\{\}}

    \definecolor{bgcolor}{HTML}{fbe9e7}
    \let\oldtexttt\texttt
    \newcommand{\code}[1]{\begingroup\setlength{\fboxsep}{1pt}\colorbox{bgcolor}{\oldtexttt{\hspace*{2pt}\vphantom{A}#1\hspace*{2pt}}}\endgroup}
    \renewcommand{\texttt}[1]{\code{\oldtexttt{#1}}}    

---

\maketitle
\thispagestyle{empty}
\clearpage