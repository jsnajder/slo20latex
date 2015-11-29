% Slovenscina 2.0 LaTeX class definition
% (c) 2015 Jan Snajder
% Version: 1.0, 2015-08-25
%
% Change log:
%   2015-08-26 (Jan Snajder)   First version
%

% ----------------------------------------------------------------------------
% Class identification
% ----------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{slo20}[2015/08/25 Slovenscina 2.0 class]

\typeout{--- Slovenscina 2.0 LaTeX class ---}
\typeout{(c) 2015 Jan Snajder}
\typeout{Version: 1.0, 2015-08-25}

\RequirePackage[utf8]{inputenc}

% ----------------------------------------------------------------------------
% Options declarations and processing
% ----------------------------------------------------------------------------

\def\@georgia{0}
\DeclareOption{georgia}{%
  \def\@georgia{1}
}

\def\@english{0}
\DeclareOption{english}{%
  \def\@english{1}
  \def\@slovene{0}
}

\def\@slovene{0}
\DeclareOption{slovene}{%
  \def\@slovene{1}
  \def\@english{0}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

% ----------------------------------------------------------------------------
% Article class
% ----------------------------------------------------------------------------

\LoadClass[10pt,a4paper]{article}

% ----------------------------------------------------------------------------
% Paper metadata
% ----------------------------------------------------------------------------

\newcommand{\red}[1]{\textcolor{red}{#1}}
\def\@pubyear{\red{2015}}
\newcommand{\pubyear}[1]{\def\@pubyear{#1}}
\def\@volume{\red1}
\newcommand{\volume}[1]{\def\@volume{#1}}
\def\@issue{\red1}
\newcommand{\issue}[1]{\def\@issue{#1}}
\def\@pubnum{\red{01}}
\newcommand{\pubnum}[1]{\def\@pubnum{#1}}
\def\@pagefrom{\red1}
\def\@pageto{\red1}
\newcommand{\pages}[2]{%
  \def\@pagefrom{#1}
  \setcounter{page}{\@pagefrom}
  \def\@pageto{#2}}
\def\@puburl{http://www.trojina.org/slovenscina.20/arhiv/\@pubyear/\@issue/ Slo2.0\_\@pubyear\_\@issue\_\@pubnum.pdf}
\newcommand{\puburl}[1]{\def\@puburl{#1}}
\def\@title{}
\renewcommand{\title}[1]{\def\@title{#1}}
\def\@naslov{}
\newcommand{\naslov}[1]{\def\@naslov{#1}}
\def\@abstract{}
\renewcommand{\abstract}[1]{\def\@abstract{#1}}
\def\@keywords{}
\newcommand{\povzetek}[1]{\def\@povzetek{#1}}
\def\@keywords{}
\newcommand{\keywords}[1]{\def\@keywords{#1}}
\def\@kljucneBesede{}
\newcommand{\kljucneBesede}[1]{\def\@kljucneBesede{#1}}
\def\@authorsshort{\red{Authors}}
\def\@authors{}
\newcommand{\authors}[2]{
  \def\@authors{#1}
  \def\@authorsshort{#2}
}

% ----------------------------------------------------------------------------
% Page size and fonts
% ----------------------------------------------------------------------------

\RequirePackage[paperwidth=16cm,paperheight=23cm,top=3cm,bottom=3.25cm,left=1.9cm,right=1.9cm,footskip=2cm]{geometry}
\renewcommand{\normalsize}{\fontsize{10pt}{12pt}\selectfont}
\RequirePackage{setspace}
\linespread{1.4}

% ----------------------------------------------------------------------------
% Paragraphs
% ----------------------------------------------------------------------------

\setlength{\parskip}{0.8em}
\setlength{\parindent}{0cm}

% ----------------------------------------------------------------------------
% Lists
% ----------------------------------------------------------------------------

\RequirePackage{enumitem}
\setlist{nolistsep}
\setlist[itemize]{leftmargin=*,labelsep=1em}
\setlist[itemize,1]{label=--}

% ----------------------------------------------------------------------------
% Colors
% ----------------------------------------------------------------------------

\RequirePackage[usenames,dvipsnames]{color}
\definecolor{slogray}{rgb}{0.35,0.35,0.35}
\definecolor{lightgray}{rgb}{0.75,0.75,0.75}
\newcommand{\slourl}[1]{{\footnotesize\textcolor{slogray}{#1}}}

\RequirePackage{microtype}

% ----------------------------------------------------------------------------
% Header and footers
% ----------------------------------------------------------------------------

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\fancyhead[LO,LE]{{\small\textcolor{slogray}{\emph{Slovenščina 2.0}, \@issue\ (\@pubyear): \@pagefrom--\@pageto}}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[CO,CE]{[\hspace{0.2ex}\thepage\hspace{0.2ex}]}

% ----------------------------------------------------------------------------
% Sections
% ----------------------------------------------------------------------------

\RequirePackage[compact]{titlesec}
\titleformat{\section}{\lsstyle\small\bfseries}{\small\bfseries\thesection}{1ex}{\MakeUppercase}{}
\titleformat{\subsection}{\lsstyle\small\bfseries}{\small\bfseries\thesubsection}{1ex}{}{}
\titleformat{\subsubsection}{\small\uppercase}{\small\thesubsubsection}{1ex}{}{}
\titlespacing*{\section}{0pt}{0.5em}{0em}
\titlespacing*{\subsection}{0pt}{0.5em}{0em}
\titlespacing*{\subsubsection}{0pt}{0.5em}{0em}

% ----------------------------------------------------------------------------
% Footnotes
% ----------------------------------------------------------------------------

\RequirePackage[hang,flushmargin]{footmisc} 
\renewcommand{\footnotemargin}{0.00001pt}
\renewcommand{\footnotelayout}{\hspace{7pt}}

% ----------------------------------------------------------------------------
% URLs
% ----------------------------------------------------------------------------

\RequirePackage{url}
\RequirePackage{relsize}
\renewcommand\UrlFont{\smaller[1]\color{slogray}\rmfamily}

% ----------------------------------------------------------------------------
% Tables
% ----------------------------------------------------------------------------

\RequirePackage{colortbl}
\RequirePackage{booktabs}
\newcommand{\rowline}[0]{%
\arrayrulecolor{lightgray}\midrule\arrayrulecolor{black}}


% ----------------------------------------------------------------------------
% Captions
% ----------------------------------------------------------------------------

\RequirePackage{caption}
\captionsetup{labelsep=colon,justification=justified,singlelinecheck=off,labelfont={small,bf},font={small}}

% ----------------------------------------------------------------------------
% Language
% ----------------------------------------------------------------------------

\if\@slovene1\RequirePackage[slovene]{babel}\fi

% ----------------------------------------------------------------------------
% Bibliography
% ----------------------------------------------------------------------------

\RequirePackage{natbib}
\renewcommand*{\bibfont}{\raggedright} 
\setlength{\bibhang}{1cm}
\def\biband{\if\@slovene1{in}\else{\&}\fi}
\def\bibetal{\if\@slovene1{idr.}\else{et~al.}\fi}
\def\bibin{\if\@slovene1{V}\else{In}\fi}
\def\bibeditor{\if\@slovene1{ur.}\else{Ed.}\fi}
\def\bibeditors{\if\@slovene1{ur.}\else{Eds.}\fi}
\def\bibpage{\if\@slovene1{stran}\else{page}\fi}
\def\bibpages{\if\@slovene1{strani}\else{pages}\fi}
\def\bibvolume{\if\@slovene1{Zvezek}\else{Volume}\fi}
\def\bibof{\if\@slovene1{od}\else{of}\fi}
\def\biboxfordcomma{\if\@slovene1{}\else{,}\fi}
\def\bibretrieved{\if\@slovene1{Pridobljeno}\else{Retrieved}\fi}
\def\bibretrievedfrom{\if\@slovene1{.~s}\else{, from}\fi}
\def\bibnodate{\if\@slovene1{n.~p.}\else{n.~d.}\fi}
\if\@english1{\renewcommand{\refname}{\textls*[110]{BIBLIOGRAPHY}}\else{%
\addto{\captionsslovene}{\renewcommand{\refname}{\textls*[110]{LITERATURA}}}}\fi

% ----------------------------------------------------------------------------
% Front matter
% ----------------------------------------------------------------------------

\newcommand{\name}[1]{%
{\large #1\newline}}
\newcommand{\affiliation}[1]{%
\\[-1.4em]{\small\begin{spacing}{1.2}#1\end{spacing}}\vspace*{1em}}
\renewcommand{\maketitle}[0]{%
\begin{flushleft}
{\large\textbf{\MakeUppercase{\if\@english1\@title\else\@naslov\fi}}}\\
\vspace{2em}
\@authors
\end{flushleft}
\vspace{-0.8em}
{\small\begin{spacing}{1.2}\emph{\@authorsshort~(\@pubyear): \@title. Slovenščina 2.0, \@volume\,(\@issue): \@pagefrom--\@pageto.\\
URL: \slourl{\@puburl}.}\end{spacing}}
\vspace*{-0.1em}
\begin{center}
\begin{minipage}{11cm}
{\small \if\@english 1\@abstract\else\@povzetek\fi}
\end{minipage}
\end{center}
{\small
\if \@english 1
  \textbf{Keywords:} \@keywords
\else
  \textbf{Ključne besede:} \@kljucneBesede
\fi}
}

% ----------------------------------------------------------------------------
% Back matter
% ----------------------------------------------------------------------------

\newcommand{\makeepilogue}[0]{%
\begin{flushleft}
{\large\textbf{\MakeUppercase{\if \@english 0\@title\else\@naslov\fi}}}
\end{flushleft}
\vspace{1ex}
\begin{center}
\begin{minipage}{11cm}
{\small \if\@english 0\@abstract\else\@povzetek\fi}
\end{minipage}
\end{center}
{\small
\if \@english 0
  \textbf{Keywords:} \@keywords
\else
  \textbf{Ključne besede:} \@kljucneBesede
\fi}
}

% ----------------------------------------------------------------------------
% License page
% ----------------------------------------------------------------------------

\newenvironment{nopgbreak}
  {\par\nobreak\vfil\penalty0\vfilneg
   \vtop\bgroup}
  {\par\xdef\tpd{\the\prevdepth}\egroup
   \prevdepth=\tpd}

\newcommand{\makelicense}[0]{%
\begin{nopgbreak}
\begin{center}
To delo je ponujeno pod licenco Creative Commons: Priznanje avtorstva --
Deljenje pod enakimi pogoji 2.5 Slovenija.

This work is licensed under the Creative Commons Attribution ShareAlike 2.5
License Slovenia.\\[2ex]
\slourl{http://creativecommons.org/licenses/by-sa/2.5/si/}\\[3.5ex]
\includegraphics[scale=0.8]{cc.png}
\end{center}
\end{nopgbreak}
}

% ----------------------------------------------------------------------------
% Georgia font
% ----------------------------------------------------------------------------

\if \@georgia 1
  \RequirePackage{mathgifg}
  \ifpdf
     \pdfmapfile{+mathgifg.map}
  \fi
\fi 

% ----------------------------------------------------------------------------
% Document structure
% ----------------------------------------------------------------------------

\AtBeginDocument{
\maketitle
}

\AtEndDocument{
\newpage
\makeepilogue
\vspace{2em}
\makelicense
}

