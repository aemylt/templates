\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{templates/thesis}[2012/05/04 UoB CS LaTeX class, Dan Page <page@cs.bris.ac.uk>]

\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}

\pgfkeys{/thesis/.cd,
  % options
      author/.store in=\thesis@author,     % string
  supervisor/.store in=\thesis@supervisor, % string
      degree/.store in=\thesis@degree,     % [BSc|MEng|MSci|MSc|PhD]
       title/.store in=\thesis@title,      % string
    subtitle/.store in=\thesis@subtitle,   % string
        year/.store in=\thesis@year,       % string
        length/.store in=\thesis@length,       % string
  % defaults
      author = {},
  supervisor = {},
      degree = {MEng},
       title = {},
    subtitle = {},
        year = {\the\year}
        length = {}
}

\ProcessPgfOptions{/thesis}
\LoadClass[10pt,a4paper,twoside]{book}

% see http://www.ctan.org/tex-archive/macros/latex/required/graphics
\RequirePackage{graphicx}
% see http://www.ctan.org/tex-archive/macros/latex/required/amslatex/
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% see http://www.ctan.org/tex-archive/macros/latex/contrib/adjustbox
\RequirePackage{adjustbox}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/etoolbox
\RequirePackage{etoolbox}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/fancyhdr
\RequirePackage{fancyhdr}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/geometry
\RequirePackage{geometry}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/datetime/
\RequirePackage{datetime}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/algorithm2e
\RequirePackage[algochapter,linesnumbered]{algorithm2e}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/listings
\RequirePackage{listings}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/url
\RequirePackage{url}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/hyperref
\RequirePackage{hyperref}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/lipsum
\RequirePackage{lipsum}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{tikz}
\usetikzlibrary{automata}
\RequirePackage[caption=false]{subfig}
\RequirePackage{tabularx}
\RequirePackage{braket}
\RequirePackage[vcentermath]{youngtab}
\RequirePackage[all]{nowidow}
\RequirePackage{doi}

% see http://www.ctan.org/tex-archive/usergrps/dante/dtk
%\RequirePackage{dtklogos}

\makeatletter

% =============================================================================

% configure algorithms
\DontPrintSemicolon
\SetKwFunction{FnBTSAT}{BacktrackSAT}
\SetKwFunction{FnTSPthree}{TSP3}
\SetKwFunction{FnPredicatethree}{P3}
\SetKwFunction{FnHeuristicthree}{h3}
\SetKwFunction{FnReductionthree}{Reduce3}
\SetKwFunction{FnPredicatefour}{P4}
\SetKwFunction{FnHeuristicfour}{h4}
\SetKwFunction{FnReductionfour}{Reduce4}
\SetKwProg{Fn}{Function}{ is}{end}

% configure listings
\lstset{basicstyle=\ttfamily,captionpos=b}
\renewcommand{\lstlistlistingname}{List of Listings}

% configure style of table of contents
\setcounter{tocdepth}{1}

% configure style of bibliography
\bibliographystyle{unsrturl}

% configure style of pages
\geometry{a4paper}

\fancypagestyle{plain}{
  \fancyhf{}

  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0.5pt}

  \fancyfoot[C]{\thepage}
}

\fancypagestyle{marked}{
  \fancyhf{}

  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0.5pt}

  \fancyhead[LO]{\slshape \rightmark}
  \fancyhead[RE]{\slshape  \leftmark}

  \fancyfoot[C]{\thepage}
}

\pagestyle{plain}


% -----------------------------------------------------------------------------

% define macro to generate UoB title page

\renewcommand{\maketitle}{
  \newpage
  \thispagestyle{empty}
  \pagenumbering{gobble}

  \vspace*{\fill}
  \begin{center}
                 {\LARGE \thesis@title}                        \\
  \ifcsempty{thesis@subtitle}{}{{\Large \thesis@subtitle \\}}

                       \vspace{2cm}
          \includegraphics{templates/logos/bristolcrest_colour}          \\
                       \vspace{2cm}
                 {\Large \thesis@author}                       

                       \vspace{1cm}
                \rule{0.5\textwidth}{0.5pt}
                       \vspace{1cm}

        A dissertation submitted to the University of Bristol
        in accordance with the requirements for award of the degree of
  \mbox{\ifcsstring{thesis@degree}{BSc} {Bachelor of Science}{}%
        \ifcsstring{thesis@degree}{MEng}{Master   of Engineering}{}%
        \ifcsstring{thesis@degree}{MSci}{Master   of Science}{}%
        \ifcsstring{thesis@degree}{MSc} {Master   of Science}{}%
        \ifcsstring{thesis@degree}{PhD} {Doctor   of Philosophy}{}%
  } in the Faculty of Science.                                

                       \vspace{1cm}
                \rule{0.5\textwidth}{0.5pt}
                       \vspace{1cm}
                       
                School of Physics                       \\
                University of Bristol\\
                       \vspace{1cm}

                         \thesis@year

  \end{center}
  \vspace*{\fill}
  \begin{flushright}
  \thesis@length\ words
  \end{flushright}
}

% define macro to generate UoB declaration

\newcommand{\makedecl}{
  \newpage
  \thispagestyle{plain}

  \chapter*{Declaration}

  I declare that the work in this dissertation was carried out in accordance with the requirements of the University's Regulations and Code of Practice for Research Degree Programmes and that it has not been submitted for any other academic award. Except where indicated by specific reference in the text, the work is the candidate's own work. Work done in collaboration with, or with the assistance of, others, is indicated as such. Any views expressed in the dissertation are those of the author.

  \vspace{3cm}

\noindent SIGNED: \thesis@author \hspace{2cm} DATE: \today
}

% define macros to mark front, main and back matter

\renewcommand{\frontmatter}{
  \cleardoublepage
  \pagestyle{plain}
  \pagenumbering{roman}
}
\renewcommand{\mainmatter}{
  \cleardoublepage
  \pagestyle{marked}
  \pagenumbering{arabic}
}
\renewcommand{\backmatter}{
  \cleardoublepage
  \pagestyle{marked}
}

% define macros to consistently generate thesis type field

\newcommand{\typemeng}[1]{%
  \ifstrequal{#1}{E}{enterprise}{}%
  \ifstrequal{#1}{R}{research}{}%
}%
\newcommand{\typemsc}[3]{%
  $(#1,#2,#3)$%
}%

% =============================================================================

\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{problem}{Problem}[chapter]
\newtheorem{definition}{Definition}[chapter]

\DeclareMathOperator{\per}{per}

\DeclareMathOperator{\p}{\textrm{P}}
\DeclareMathOperator{\np}{\textrm{NP}}
\DeclareMathOperator{\bpp}{\textrm{BPP}}
\DeclareMathOperator{\sharpp}{\#\textrm{P}}
\DeclareMathOperator{\true}{\textrm{True}}
\DeclareMathOperator{\false}{\textrm{False}}

\DeclareMathOperator{\poly}{poly}
\DeclareMathOperator{\polylog}{polylog}
\DeclareMathOperator{\symm}{\textrm{S}}
\DeclareMathOperator{\unitary}{\textrm{U}}
\DeclareMathOperator{\tdist}{\delta_\textrm{tr}}
\DeclareMathOperator{\trace}{\textrm{Tr}}
\DeclareMathOperator{\var}{\textrm{Var}}
\DeclareMathOperator{\cov}{\textrm{Cov}}
\DeclareMathOperator{\prob}{\textrm{Pr}}
\DeclareMathOperator{\mean}{\mathbb{E}}

\DeclareGraphicsExtensions{.pdf}

\def\Id{1\!\mathrm{l}}
\newcommand{\mr}[1]{\mathrm{#1}}

% =============================================================================

% define column type for overflowing columns in tables
\newcolumntype{C}{>{\centering\arraybackslash}X}

% =============================================================================

\makeatother
