% ==================================================
% ABOUT RESEARCHNOTES CLASS
% ==================================================
% Class:   SimpleNotes.cls
% Version: 1.0 (17/04/2016)
% Author:  Erick Chacon Montalvan (eral.th07@gmail.com)
% License: GNU General Public License (GPL) 3.0
% ==================================================

% --------------------------------------------------
% DEFINING BASIC INFORMATION
% --------------------------------------------------
\newcommand{\SimpleNotesUpdate}{2017/11/25}
\newcommand{\SimpleNotesVersion}{1.0}
% Allways required sentences.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SimpleNotes}[\SimpleNotesUpdate\space Version
\SimpleNotesVersion\space by Erick A. Chacon-Montalvan, Lancaster University]
% Allow give margin options.
\RequirePackage{kvoptions}
\DeclareStringOption[4cm]{top}
\DeclareStringOption[3.5cm]{bottom}
\DeclareStringOption[1.2cm]{right}
\DeclareStringOption[1.5cm]{left}
\ProcessKeyvalOptions*
% Pass unknown options to article class.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
% Process the options given by the user.
\ProcessOptions\relax
\PassOptionsToPackage{top=\SimpleNotes@top, bottom=\SimpleNotes@bottom, right=\SimpleNotes@right, left=\SimpleNotes@left}{geometry}
% Loas article class.
\LoadClass{article}

% --------------------------------------------------
% REQUIRED PACKAGES
% --------------------------------------------------
\RequirePackage{geometry} % easily set margins
\RequirePackage{fancyhdr} % control header and footer position
\RequirePackage{titletoc} % manipulate table of contents
\RequirePackage{tikz} % draw custom shapes
\RequirePackage{titlesec} % customization of titles
\RequirePackage{tcolorbox} % boxes with colors
\RequirePackage[plainpages=false,pdfpagelabels,breaklinks=true]{hyperref} %hidelinks
\RequirePackage{amssymb, amsmath} % for mathematical formulas
\RequirePackage{xparse}

% --------------------------------------------------
% NEW COMMANDS AND ENVIRONMENTS I
% --------------------------------------------------
\renewcommand{\headrulewidth}{0pt} % do not show rule on header and foot
\setlength{\headheight}{27.7pt} % should be large enough
\titleformat{\section}[block]{\color{\@fiscolor}\bfseries\large}{\color{\@fiscolor}\thesection.}{0.5em}{}[] % change aesthetic of section
\titleformat{\subsection}[block]{\color{\@fiscolor}\bfseries}{\color{\@fiscolor}\thesubsection.}{0.5em}{}[] % change aesthetic of section
\titleformat{\subsubsection}[block]{\color{\@fiscolor}\bfseries}{\color{\@fiscolor}}{0em}{}[] % change aesthetic of section
\definecolor{chicol}{RGB}{181,18,27}
\newcommand{\fp}[1][chicol]{ % red box for equation
\tag*{\tikz \path [fill=white]  (0,0) rectangle (7pt,7pt);}
}
\newenvironment{sframe}[2][chicol] % boxes
  {\begin{tcolorbox}[colframe=white,colback=white, boxrule=0.5pt]}
  {\end{tcolorbox}}
%\definecolor{main_color}{RGB}{181,18,27}
%\colorlet{tit_color}{main_color!80!black}
%\colorlet{box_color}{main_color!10}
%\colorlet{type_color}{black!60}

% --------------------------------------------------
% NEW COMMANDS AND ENVIRONMENTS II
% --------------------------------------------------
% Initialise variables.
\gdef\@doctype{}
\gdef\@abstract{}
\gdef\@absname{}
\gdef\@keywords{}
\gdef\@keyname{}
\gdef\@institute{}
% Commands to read options.
\newcommand{\doctype}[1]{\gdef\@doctype{#1}}
\renewcommand{\title}[1]{\gdef\@title{#1}}
\newcommand{\titleshort}[1]{\gdef\@titleshort{#1}}
\newcommand{\authorfoot}[1]{\gdef\@authorfoot{#1}}
\renewcommand{\abstract}[2][Abstract:]{\gdef\@absname{#1}\gdef\@abstract{#2}}
\newcommand{\keywords}[2][Keywords:]{\gdef\@keyname{#1}\gdef\@keywords{#2}}
\newcommand{\institute}[1]{\gdef\@institute{#1}}
\newcommand{\logos}[2]{\gdef\@firlogo{#1} \gdef\@seclogo{#2}}
\newcommand{\colors}[4]{\gdef\@fiscolor{black} \gdef\@titcolor{black}
\gdef\@boxcolor{#3} \gdef\@typecolor{#4}}
% Send a warning when the command is not called.
\renewcommand{\@title}{\@latex@warning@no@line{
SimpleNotes Class: No \noexpand\title given}}
\newcommand{\@titleshort}{\@latex@warning@no@line{
SimpleNotes Class: No \noexpand\titleshort given}}
\newcommand{\@authorfoot}{\@latex@warning@no@line{
SimpleNotes Class: No \noexpand\authorfoot given}}

% Environment for abstract
\RenewDocumentEnvironment{abstract}{o O{0.90} O{0.95}}
  {
    \hspace{\dimexpr (- \parindent +  \textwidth / 2 - #2 \textwidth / 2)}
    \begin{minipage}{#2 \textwidth}
      % {\section*{\centering Abstract}}
      \begin{center}
        {\bfseries\large Abstract}
      \end{center}
  }
  {
    \end{minipage}
    {\ }\\[2ex]

    \hspace{\dimexpr (- \parindent +  \textwidth / 2 - #3 \textwidth / 2)}
    \begin{minipage}{#3 \textwidth}
      \textbf{\textit{Keywords:}}
      #1
    \end{minipage}
    {\ }\\[2ex]
  }

% --------------------------------------------------
% DEFINING THE TITLE PAGE
% --------------------------------------------------
\renewcommand{\maketitle}{

\thispagestyle{plain} % plain-style pages such as chapters and titlepage
\if@twocolumn
\twocolumn[{
\fi

  \vskip 2em
  \begin{center}
    {\LARGE \bf \@title\par}
    \vskip 2em
    {\large \@author\par}
    \vskip 1em
    {\small\@institute\par}
    \vskip 1em
    {\@date\par}
    \vskip 1.5em
    % {\bf \@absname\par}
    % \vskip 1.5em
  \end{center}

  % \ifx\@abstract\@empty
  % \else
  %   \noindent\makebox[\textwidth][c]{
  %     \begin{minipage}{0.9\textwidth}
  %     {\@abstract}
  %     \end{minipage}
  %   \par}
  %
  %   \ifx\@keywords\@empty
  %     \vskip 2em
  %   \else
  %     \vskip 1em
  %     {\noindent\textbf{\@keyname} \@keywords\par}
  %     \vskip 2em
  %   \fi
  % \fi

\if@twocolumn
}]
\fi
}
