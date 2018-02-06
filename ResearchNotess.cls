% ==================================================
% ABOUT RESEARCHNOTES CLASS
% ==================================================
% Class:   ResearchNotess.cls
% Version: 1.0 (17/04/2016)
% Author:  Erick Chacon Montalvan (eral.th07@gmail.com)
% License: GNU General Public License (GPL) 3.0
% ==================================================

% --------------------------------------------------
% DEFINING BASIC INFORMATION
% --------------------------------------------------
\newcommand{\ResearchNotessUpdate}{2016/04/17}
\newcommand{\ResearchNotessVersion}{1.0}
% Allways required sentences.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ResearchNotess}[\ResearchNotessUpdate\space Version
\ResearchNotessVersion\space by Erick A. Chacon-Montalvan, Lancaster University]
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
\PassOptionsToPackage{top=\ResearchNotess@top, bottom=\ResearchNotess@bottom, right=\ResearchNotess@right, left=\ResearchNotess@left}{geometry}
% \geometry{top=3.7cm, bottom=3.5cm, right=2.5cm, left=3cm}
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
% \RequirePackage[plainpages=false,pdfpagelabels,breaklinks=true]{hyperref} %hidelinks
\RequirePackage{amssymb, amsmath} % for mathematical formulas

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
\tag*{\tikz \path [fill=#1]  (0,0) rectangle (7pt,7pt);}
}
\newenvironment{sframe}[2][chicol] % boxes
  {\begin{tcolorbox}[colframe=#1,colback=#2, boxrule=0.5pt]}
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
\gdef\@keywords{}
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
\newcommand{\colors}[4]{\gdef\@fiscolor{#1} \gdef\@titcolor{#2}
\gdef\@boxcolor{#3} \gdef\@typecolor{#4}}
% Send a warning when the command is not called.
\renewcommand{\@title}{\@latex@warning@no@line{
ResearchNotess Class: No \noexpand\title given}}
\newcommand{\@titleshort}{\@latex@warning@no@line{
ResearchNotess Class: No \noexpand\titleshort given}}
\newcommand{\@authorfoot}{\@latex@warning@no@line{
ResearchNotess Class: No \noexpand\authorfoot given}}
% --------------------------------------------------
% DEFINING THE TITLE PAGE
% --------------------------------------------------
\renewcommand{\maketitle}{
\thispagestyle{plain} % plain-style pages such as chapters and titlepage
\if@twocolumn
\twocolumn[{
\fi
% White space.
{\ }\\[-4ex]
% Type of document.
\noindent\ifx\@doctype\@empty\else
{\Large \bf \textcolor{\@typecolor}{\@doctype}\par}
\fi
% Title.\linespread{1.5}
% {\LARGE \textbf{\textcolor{\@titcolor}{\@title}}}\\[3ex]
% \begin{center}
{\centering \linespread{1.1}\LARGE \bf \textcolor{\@titcolor}{\@title}\par}
% \end{center}
{\ }\\[0.3ex]
% {\LARGE \textbf{\textcolor{\@titcolor}{\@title}}}\\[3ex]
% Author and date.
% {\large \textcolor{\@fiscolor}{\textsc{\@author \hfill \@date}}}\\[3ex]
{\centering \large \textcolor{\@fiscolor}{\textsc{\@author}}\par}
{\ }\\[0.3ex]
% {\large \textcolor{\@fiscolor}{\textsc{\@date}}}\\[3ex]
{\centering \large \textcolor{\@fiscolor}{\textsc{\@date}}\par}
    % \vskip 1.5em%
{\ }\\[0.3ex]
% Abstract box.
\ifx\@abstract\@empty
\begingroup%
\raggedright\sffamily\small%
\footnotesize\@institute\par%
\endgroup%%
\else
\fcolorbox{\@fiscolor}{white}{%
\parbox{\dimexpr (\textwidth-2\fboxsep-2\fboxrule)}{\centering%
\colorbox{\@boxcolor}{%
\parbox{\dimexpr (\textwidth-4\fboxsep-2\fboxrule)}{%
{\large \textcolor{\@fiscolor}{\textbf{\@absname}}}\\[1ex]
\@abstract
\ifx\@keywords\@empty\else
\\[3ex]
{\large \textcolor{\@fiscolor}{\textbf{\@keyname}}}\\[1ex]
\@keywords\\[-1ex]
\fi
}}%
\ifx\@institute\@empty\else
\vskip4pt%
\begingroup%
\raggedright\sffamily\small%
\footnotesize\@institute\par%
\endgroup%%
\fi
}}
\fi
\if@twocolumn
{\ }\\[1ex]
}]
\fi
}

% --------------------------------------------------
% HEADER AND FOOT
% --------------------------------------------------
\pagestyle{fancyplain} %  for absolutely all pages.
\fancyhf{} % clean customization
% Header.
\lhead{\fancyplain{
  \begin{tikzpicture} [remember picture,overlay]
  \coordinate (n1) at (0, 0);
  \coordinate (n2) at (\textwidth,0);
  %\draw[fill = green] (n1) circle [radius=0.1cm];
  \ifx\@firlogo\@empty
  \else
  \node [anchor=south west, inner sep=0pt] at (n1) {\includegraphics[height={\the\dimexpr (1in + \voffset + \topmargin)*7/10\relax}]{\@firlogo}};
  \fi
  \ifx\@seclogo\@empty%
  \else
  \node [anchor=south east, inner sep=0pt] at (n2) {\includegraphics[height={\the\dimexpr (1in + \voffset + \topmargin)*7/10\relax}]{\@seclogo}};
  \fi%
  \end{tikzpicture}
  \\ \hspace{\dimexpr(-1in - \hoffset - \oddsidemargin)}\makebox[\textwidth][l]{\textcolor{\@fiscolor}{\rule{\paperwidth}{0.2cm}}}\\
}{
  \begin{tikzpicture} [remember picture,overlay]
  \coordinate (n3) at (0, 0);
  \coordinate (n4) at (\textwidth,0);
  %\draw[fill = green] (n1) circle [radius=0.1cm];
  \ifx\@firlogo\@empty
  \else
  \node [anchor=south west, inner sep=0pt] at (n3) {\includegraphics[height={\the\dimexpr (1in + \voffset + \topmargin)*7/10\relax}]{\@firlogo}};
  \fi
  \ifx\@seclogo\@empty
  \else
  \node [anchor=south east, inner sep=0pt] at (n4) {\includegraphics[height={\the\dimexpr (1in + \voffset + \topmargin)*7/10\relax}]{\@seclogo}};
  \fi
  \end{tikzpicture}
  \\ \hspace{\dimexpr(-1in - \hoffset - \oddsidemargin)}\makebox[\textwidth][l]{\textcolor{\@fiscolor}{\rule{\paperwidth}{0.2cm}}} \\
  \hfill \textcolor{\@fiscolor}{\textbf{\@titleshort}}
}}
% Foot.
\lfoot{\fancyplain{
  \hspace{\dimexpr(-1in - \hoffset - \oddsidemargin)}\makebox[\textwidth][l]{\textcolor{\@fiscolor}{\rule{\paperwidth}{0.2cm}}}\\
   \hfill \textcolor{\@fiscolor}{\textbf{\thepage}}\\
}{
  \hspace{\dimexpr(-1in - \hoffset - \oddsidemargin)}\makebox[\textwidth][l]{\textcolor{\@fiscolor}{\rule{\paperwidth}{0.2cm}}}\\
  \textcolor{\@fiscolor}{\textbf{\@authorfoot}} \hfill \textcolor{\@fiscolor}{\textbf{\thepage}}\\
}}
\endinput
