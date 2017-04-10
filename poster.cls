\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{templates/poster}[2012/05/04 UoB CS LaTeX class, Dan Page <page@cs.bris.ac.uk>]

\RequirePackage{pgfkeys}
\RequirePackage{pgfopts}

\pgfkeys{/poster/.cd,
}

\ProcessPgfOptions{/poster}
\LoadClass[final]{beamer}

% see http://www.ctan.org/tex-archive/macros/latex/required/amslatex/
\RequirePackage{amsmath}
\RequirePackage{amssymb}

% see http://tug.ctan.org/tex-archive/macros/latex/contrib/beamerposter/
\RequirePackage[orientation=portrait,size=a1,scale=1.5]{beamerposter}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/url
\RequirePackage{url}
% see http://www.ctan.org/tex-archive/macros/latex/contrib/hyperref
\RequirePackage{hyperref}

\RequirePackage{xpatch}

\makeatletter

% =============================================================================

\newcommand{\postertitle}[1]{\def \@postertitle {#1}}
\newcommand{\posterauthors}[1]{\def \@posterauthors {#1}}
\newcommand{\posteraffils}[1]{\def \@posteraffils {#1}}
\newcommand{\posterref}[1]{\def \@posterref {#1}}

% define the official UoB red color as an RGB triple
\definecolor{uobred}{RGB}{191,47,56}

% configure hyperref
\hypersetup{colorlinks=true,bookmarks=false,urlcolor=red}

% configure the beamer package in a way that beamerposter can cope with
\usetheme[footheight=0.7cm]{boxes} 
\usecolortheme{rose}

% configure the poster header
\setbeamertemplate{headline}{  
  \leavevmode
  \begin{beamercolorbox}[wd=\paperwidth]{headline}
  \begin{columns}[c]
  \begin{column}{.90\paperwidth}
  \begin{center}
  \vspace{4ex}
  \raggedright
  {\Huge  \@postertitle}                                                                       \\ [4ex]
  {\normalsize \@posterauthors} \\ [4ex]
  {\normalsize \@posteraffils} \\ [4ex]
  {\normalsize \@posterref}
  \vspace{4ex}
  \end{center}
  \end{column}
  \end{columns}
  \end{beamercolorbox}
}

% configure the poster footer
\setbeamertemplate{footline}{
  \leavevmode
  \begin{beamercolorbox}[wd=\paperwidth,center]{footline}
  \begin{columns}[t]
  \begin{column}{.05\paperwidth}
  \end{column}
  \begin{column}{.13\paperwidth}
  \begin{center}
  \includegraphics[height=2.5cm]{templates/logos/logo_uob_color}
  \end{center}
  \vspace{2cm}
  \end{column}
  \begin{column}{.11\paperwidth}
  \begin{center}
  \includegraphics[height=2.5cm]{templates/logos/qetlabs.png}
  \end{center}
  \vspace{2cm}
  \end{column}
  \begin{column}{.15\paperwidth}
  \begin{center}
  \includegraphics[height=2.5cm]{templates/logos/qci.jpg}
  \end{center}
  \vspace{2cm}
  \end{column}
  \begin{column}{.12\paperwidth}
  \begin{center}
  \includegraphics[height=2.5cm]{templates/logos/qecdt.png}
  \end{center}
  \vspace{2cm}
  \end{column}
  \begin{column}{.10\paperwidth}
  \begin{center}
  \includegraphics[height=2.5cm]{templates/logos/epsrc.jpg}
  \end{center}
  \vspace{2cm}
  \end{column}
  \begin{column}{.10\paperwidth}
  \begin{center}
  \includegraphics[height=2.5cm]{templates/logos/himr.jpg}
  \end{center}
  \vspace{2cm}
  \end{column}
  \begin{column}{.05\paperwidth}
  \end{column}
  \end{columns}
  \end{beamercolorbox}
}

% configure beamer to match requirements of a poster rather than slides
\setbeamercolor{headline}{bg=uobred,fg=white}
\setbeamercolor{footline}{bg=white,fg=black}

\setbeamersize{text margin left=0.0cm}
\setbeamersize{text margin right=0.0cm}
\setbeamersize{sidebar width left=0cm}
\setbeamersize{sidebar width right=0cm}

\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{bibliography item}[text]

\addtobeamertemplate{block begin}{}{\setlength{\parindent}{20pt}\@afterindentfalse\@afterheading}

\xpatchcmd{\itemize}
  {\def\makelabel}
  {\setlength{\itemsep}{0.3em}\def\makelabel}
  {}
  {}

% =============================================================================

\makeatother
