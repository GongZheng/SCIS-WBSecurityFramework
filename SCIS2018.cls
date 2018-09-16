\def\sci@fileversion{2.09}
\def\sci@filedate{2017/12/15}
\def\@journal{Sci China Inf Sci}
\def\@issn{1674-733X}
\def\@copyright{\copyright~Science China Press and Springer-Verlag GmbH Germany 2017}
\def\@website{\url{info.scichina.com}~~~~\url{link.springer.com}}

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{SCIS}[\sci@filedate, \sci@fileversion]

\LoadClass[twoside]{article}
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm,upgreek,multicol,mathrsfs,pifont,amscd,latexsym,geometry,color,fancyhdr}
%% graphics packages
\RequirePackage{graphicx,picins}
%% other packages
\RequirePackage{algorithm,algorithmic,tabularx,url,float,booktabs}
%% check pdfTeX mode
\RequirePackage{ifpdf}
\RequirePackage{fancyhdr,lastpage}
\RequirePackage[pdfstartview=FitH,colorlinks,linkcolor=black,citecolor=black,filecolor=black,urlcolor=black,hyperindex,CJKbookmarks]{hyperref}
\RequirePackage{breakurl}
%\RequirePackage[dvipdfm,colorlinks,linkcolor=black,citecolor=black,filecolor=black,urlcolor=black,hyperindex,CJKbookmarks]{hyperref}
\urlstyle{same}%¶¨Òåurl×ÖÌåºÍÕýÎÄÏàÍ¬
\renewcommand{\today}{\number\year-\number\month-\number\day}%ÈÕÆÚ¸ñÊ½

%-------------------------- Page layout ------------------------------
\textwidth=160truemm
\textheight=226truemm
\topmargin=-30pt
\headsep=6truemm
\oddsidemargin=0pt
\evensidemargin=0pt
\parindent=0pt
\footskip=0mm
\renewcommand{\baselinestretch}{1.0}
\renewcommand{\arraystretch}{1.2}
\newcommand{\sanhao}{\fontsize{18pt}{2\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{2\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10pt}{\baselineskip}\selectfont}
\newcommand{\jiuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\bahao}{\fontsize{8pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{7pt}{0.8\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{6pt}{0.8\baselineskip}\selectfont}
\def\letter{LETTER}
\def\editorial{EDITORIAL}
\def\highlight{HIGHLIGHT}
\def\perspective{PERSPECTIVE}
\def\moop{MOOP}
\def\erratum{ERRATUM}
\def\supplementary{Supplementary File}
\def\blank{ }
\def\lastpage{\pageref{LastPage}}
\def\firstpage{\pageref{FirstPage}}

%-------------------- Article Information ----------------------------
\let\@ArticleType\@empty \def\ArticleType#1{\def\@ArticleType{#1}}
\let\@SpecialTopic\@empty \def\SpecialTopic#1{\def\@SpecialTopic{#1}}
\let\@Year\@empty \def\Year#1{\def\@Year{#1}}
\let\@Month\@empty \def\Month#1{\def\@Month{#1}}
\let\@Vol\@empty \def\Vol#1{\def\@Vol{#1}}
\let\@No\@empty \def\No#1{\def\@No{#1}}
\let\@AuthorMark\@empty \def\AuthorMark#1{\def\@AuthorMark{#1}}
\let\@AuthorCitation\@empty \def\AuthorCitation#1{\def\@AuthorCitation{#1}}
\let\@BeginPage\@empty \def\BeginPage#1{\def\@BeginPage{#1}}
\let\@EndPage\@empty \def\EndPage#1{\def\@EndPage{#1}}
\let\@DOI\@empty \def\DOI#1{\def\@DOI{#1}}
\let\@ArtNo\@empty \def\ArtNo#1{\def\@ArtNo{#1}}
\let\@ReceiveDate\@empty \def\ReceiveDate#1{\def\@ReceiveDate{#1}}
\let\@ReviseDate\@empty \def\ReviseDate#1{\def\@ReviseDate{#1}}
\let\@AcceptDate\@empty \def\AcceptDate#1{\def\@AcceptDate{#1}}
\let\@OnlineDate\@empty \def\OnlineDate#1{\def\@OnlineDate{#1}}
\let\@abstract\@empty \renewcommand\abstract[1]{\def\@abstract{#1}}
\let\@keywords\@empty \def\keywords#1{\def\@keywords{#1}}
\let\@contributions\@empty \newcommand\contributions[1]{\def\@contributions{#1}}
\def\citationline{
\ifx\@DOI\@empty {\bf Citation}\quad~ \@AuthorCitation. \@titlecitation. \@journal, for review
\else {\bf Citation}\quad~ \@AuthorCitation. \@titlecitation. \@journal, \@Year, \@Vol(\@No): \@ArtNo, \href{https://doi.org/\@DOI}{https://doi.org/\@DOI}
\fi}

%-------------------------- Title ------------------------------------
\let\@title\@empty
\renewcommand\title[3][]{
  \def\@title{#2}
  \def\@titlehead{#1}
  \def\@titlecitation{#3}
  \ifx\@titlehead\@empty\def\@titlehead{#2}\fi
  \ifx\@titlecitation\@empty\def\@titlecitation{#2}\fi
}


\let\@author\@empty
\let\@authoremail\@empty
\let\@onlyoneemail\@empty
\let\@onlyoneauthor\@empty
\let\@authorcite\@empty
\renewcommand*{\author}[3][]{%
  \ifx\@author\@empty
    \def\@author{#2\@authornote{#1}{#3}}
    \let\@authortemp\@author
  \else
    \let\@author\@authortemp
    \def\@onlyoneauthor{No}
    \expandafter\def\expandafter\@author\expandafter
      {\@author~{\&}~#2\@authornote{#1}{#3}}
    \expandafter\def\expandafter\@authortemp\expandafter
      {\@authortemp,~#2\@authornote{#1}{#3}}
  \fi

  \ifx\@AuthorCitation\@empty
    \ifx\@authorcite\@empty \def\@authorcite{#2}
    \else \expandafter\def\expandafter\@authorcite\expandafter{\@authorcite, #2}
    \fi
  \fi
  
  \ifx#3\@empty\else
      \ifx\@authoremail\@empty
          \def\@authoremail{#3}
      \else
          \def\@onlyoneemail{No}
          \expandafter\def\expandafter\@authoremail\expandafter{\@authoremail, #3}
      \fi
  \fi
}

\def\@authornote#1#2{%
  \def\SCAE@author@address{#1}%
  \def\SCAE@author@footnote{#2}%

  \ifx\SCAE@author@address\@empty\else
  \textsuperscript{#1}\hspace{-1.4mm}
  \fi

  \ifx\SCAE@author@footnote\@empty\else
  \ifx\@onlyoneauthor\@empty\else
  \ifx\@contributions\@empty
  \textsuperscript{*}\hspace{-1.4mm}
  \fi\fi\fi
}


\def\@address{}
\newcommand*{\address}[2][]{%
  \ifx \@address\@empty
    \def\@address{\@addressline{#1}{#2}}
  \else
    \expandafter\def\expandafter\@address\expandafter
      {\@address;\tabularnewline\@addressline{#1}{#2}}
  \fi}
\def\@addressline#1#2{\@addresscr\hb@xt@1ex{\textsuperscript{\rm#1}\hss}#2}
\def\@addresscr{\def\\{\tabularnewline\@addresscr\hbox to1ex{}\ignorespaces}}


\def\@foundation{}
\newcommand*{\foundation}[1]{
  \def\SCAE@foundation{#1}
  \ifx\SCAE@foundation\@empty
  \else
    \def\@foundation{\footnotetext{#1}}
  \fi
}


\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\fnsymbol{footnote}}
    \let\footnote\thanks
    \def\@makefnmark{\hbox{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\noindent\@textsuperscript{\normalfont\@thefnmark}##1}%
    \@maketitle
    \thispagestyle{empty}\@thanks
    \long\def\@makefntext##1{\noindent##1}%
    \@foundation
  \endgroup
  \renewcommand\thefootnote{\arabic{footnote}}
  \setcounter{footnote}{0}

  \setlength{\textwidth}{16cm}
  \setlength{\textheight}{23.6cm}
  \ifx\@ArticleType\letter \renewcommand{\baselinestretch}{1.0}
  \else \ifx\@ArticleType\highlight \renewcommand{\baselinestretch}{1.0}
  \else \ifx\@ArticleType\moop \renewcommand{\baselinestretch}{1.0}
  \else \ifx\@ArticleType\perspective \renewcommand{\baselinestretch}{1.0}
  \else \renewcommand{\baselinestretch}{1.1}
  \fi\fi\fi\fi
  \baselineskip 12pt
  \parindent=10.8pt
  \wuhao
  \vspace{5mm}
}

\long\def\@makefntext#1{\parindent 12pt \indent\hbox{\hss{\@thefnmark)\ }}#1}
\def\@makefnmark{\hbox\textsuperscript{\@thefnmark)}}


\def\@maketitle{
\ifthenelse{\pageref{LastPage}=1}
    {\def\@pagerank{\@ArtNo}}
    {\def\@pagerank{\@ArtNo:1--\@ArtNo:\pageref{LastPage}}}
    \renewcommand{\baselinestretch}{0.9}
    \baselineskip 9pt
    \vspace{-9mm}
    \begin{picture}(0,0)
        \put(165,23){\xiaosanhao \bf SCIENCE CHINA}
        \put(167,8){\xiaosanhao Information Sciences}
        \put(0,1){\thicklines\line(1,0){456}}
        \ifx\@DOI\@empty\else
            \put(0,7){\makebox[\textwidth][r]{\href{http://crossmark.crossref.org/dialog/?doi=\@DOI&domain=pdf&date_stamp=\today}{\includegraphics{Print-CrossMark.eps}}}}
            \put(0,-11){\makebox[\textwidth][r]{\vbox{\hbox{\footnotesize \@Month~\@Year,~Vol.~\@Vol~~\@pagerank}}}}
            \put(0,-22){\makebox[\textwidth][r]{\vbox{\hbox{\footnotesize \href{https://doi.org/\@DOI}{https://doi.org/\@DOI}}}}}
            \put(0,-660){\makebox[\textwidth][l]{\qihao\sf \@copyright}}
            \put(0,-660){\makebox[\textwidth][r]{\qihao\sf \@website}}
        \fi
    \end{picture}

    \begin{picture}(0,0)
    \rm
    \put(0,-5){\makebox[\textwidth][l]{\bf {\sanhao\raisebox{2pt}{.}}~\@ArticleType~{\sanhao\raisebox{1.5pt}{.}}}}
    \put(1,-18){\@SpecialTopic}
    \end{picture}

  \noindent
  \vskip 16mm
  \ifx\@ArticleType\editorial
    \begin{center}\LARGE\bfseries \@title\footnote{\citationline}\end{center}
  \else
    \begin{center}\LARGE\bfseries \@title \end{center}
  \fi

  \ifx\@ArticleType\editorial\else
      \vskip 0.5 true cm
      \renewcommand{\baselinestretch}{1.1}
      \baselineskip 12pt
      \begin{center}\xiaosihao{\rm
          \begin{tabular}{@{}c@{}}
          \@author
          \setcounter{footnote}{-1}
          \ifx\@onlyoneauthor\@empty
             \ifx\@contributions\@empty
                \footnote{Email:~\@authoremail}
             \else
                \footnote{Email:~\@authoremail\protect\\\@contributions}
             \fi
          \else
             \ifx\@contributions\@empty
                 \footnote{*{\thinspace}Corresponding author (email:~\@authoremail)}
             \else
                 \footnote{*{\thinspace}Corresponding author (email:~\@authoremail)\protect\\\@contributions}
             \fi
          \fi
          \end{tabular}
      }\end{center}
      
      \vskip 0.1 true cm
      \renewcommand{\baselinestretch}{0.9}
      \baselineskip 9pt
      \vspace{-5mm}
      \begin{center}\bahao{\it\begin{tabular}[t]{@{}c@{}}\@address\end{tabular}}\end{center}

      \ifx\@ArticleType\supplementary\else
          \vspace{-3mm}
          \begin{center}\liuhao{
            \ifx\@DOI\@empty\else
              \ifx\@ReviseDate\@empty
                \ifx\@OnlineDate\@empty{Received \@ReceiveDate/Accepted \@AcceptDate}
                \else{Received \@ReceiveDate/Accepted \@AcceptDate/Published online \@OnlineDate}
                \fi
              \else
                \ifx\@OnlineDate\@empty{Received \@ReceiveDate/Revised \@ReviseDate/Accepted \@AcceptDate}
                \else{Received \@ReceiveDate/Revised \@ReviseDate/Accepted \@AcceptDate/Published online \@OnlineDate}
                \fi
              \fi
            \fi
          }\end{center}
      \fi
      
      \ifx\@ArticleType\supplementary\else
      \ifx\@ArticleType\erratum\else
      \ifx\@ArticleType\letter
        \begin{center}\begin{tabular}{p{0.88\textwidth}}
        \toprule
        \renewcommand{\baselinestretch}{1.2}\scriptsize\noindent\ignorespaces\citationline\\
        \bottomrule
        \end{tabular}\end{center}
      \else
      \ifx\@ArticleType\highlight
        \begin{center}\begin{tabular}{p{0.88\textwidth}}
        \toprule
        \renewcommand{\baselinestretch}{1.2}\scriptsize\noindent\ignorespaces\citationline\\
        \bottomrule
        \end{tabular}\end{center}
      \else
      \ifx\@ArticleType\moop
        \begin{center}\begin{tabular}{p{0.88\textwidth}}
        \toprule
        \renewcommand{\baselinestretch}{1.2}\scriptsize\noindent\ignorespaces\citationline\\
        \bottomrule
        \end{tabular}\end{center}
      \else
      \ifx\@ArticleType\perspective
        \begin{center}\begin{tabular}{p{0.88\textwidth}}
        \toprule
        \renewcommand{\baselinestretch}{1.2}\scriptsize\noindent\ignorespaces\citationline\\
        \bottomrule
        \end{tabular}\end{center}
      \else
        \begin{center}\begin{tabular}{p{0.88\textwidth}}
        \toprule
        \renewcommand{\baselinestretch}{0.95}\bahao\noindent\textbf{Abstract}\quad\ignorespaces\@abstract\\
        \renewcommand{\baselinestretch}{0.95}\bahao\noindent\textbf{Keywords}\quad\ignorespaces\@keywords\\
        \hline
        \renewcommand{\baselinestretch}{1.2}\scriptsize\noindent\ignorespaces\citationline\\
        \bottomrule
        \end{tabular}\end{center}
      \fi\fi\fi\fi\fi\fi
  \fi
}


%----------------------- Running heads ---------------------------------
\def\ps@myheadings{\global\let\@oddfoot\@empty\global\let\@evenfoot\@empty
    \def\@evenhead{\vbox{\hbox to \textwidth{
        \qihao
        \rm\hbox to 0.01cm{} \hfill{
            \ifx \@onlyoneauthor\@empty
                \@AuthorMark\emph{\ \ \ \@journal}
            \else
                \@AuthorMark\emph{,~et al.\ \ \ \@journal}
            \fi
            \ifx\@DOI\@empty \ \thepage
            \else{\ \ \ \@Month~\@Year~Vol.~\@Vol~\@ArtNo:\thepage}
            \fi
        }\hfill
    }}}

    \def\@oddhead{\vbox{\hbox to \textwidth{
        \qihao\rm\hbox to 0.01cm{} \hfill{
            \ifx \@onlyoneauthor\@empty
                \@AuthorMark\emph{\ \ \ \@journal}
            \else
                \@AuthorMark\emph{,~et al.\ \ \ \@journal}
            \fi
            \ifx\@DOI\@empty \ \thepage
            \else{\ \ \ \@Month~\@Year~Vol.~\@Vol~\@ArtNo:\thepage}
            \fi
        }\hfill
    }}}

    \let\@oddfoot\@empty  \let\@evenfoot\@empty
}
\pagestyle{myheadings}


%---------------------- Acknowledgements -------------------------------
\let\@Acknowledgements\@empty \def\Acknowledgements#1{\def\@Acknowledgements{#1}}
\let\@Supplements\@empty \def\Supplements#1{\def\@Supplements{#1}}

%-------------------------- Sections ----------------------------------
\renewcommand\section{
    \@startsection{section}{1}{\z@}%
    {-4.5ex \@plus -1ex \@minus -.2ex}%
    {2.5ex \@plus.1ex}%
    {\normalfont\xiaosihao\bfseries}}

\renewcommand\subsection{
    \@startsection{subsection}{2}{\z@}%
    {-2ex\@plus -2ex \@minus -.1ex}%
    {2ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries}}

\renewcommand\subsubsection[1]{
    \@startsection{subsubsection}{3}{\z@}%
    {-3ex\@plus -1ex \@minus -.1ex}%
    {1ex \@plus .1ex}%
    {\normalfont\normalsize}{\it#1}}

\newcommand\deareditor{
    {\normalfont\normalsize\noindent Dear editor,\\\noindent}
}

\newcommand\lettersection[1]{{\it #1}.}
\columnsep 0.7cm  %Á½À¸Ö®¼äµÄ¾àÀë

\let\oldappendix\appendix
\renewenvironment{appendix}{
    \oldappendix
    \setcounter{section}{0}
    \def\thesection{Appendix \Alph{section}}
    \renewcommand{\theequation}{\Alph{section}\arabic{equation}}
    \renewcommand{\thefigure}{\Alph{section}\arabic{figure}}
    \renewcommand{\thetable}{\Alph{section}\arabic{table}}
    \renewcommand{\thealgorithm}{\Alph{section}\arabic{algorithm}}
    \renewcommand{\section}{
        \setcounter{equation}{0}
        \setcounter{table}{0}
        \setcounter{figure}{0}
        \setcounter{algorithm}{0}
        \@startsection{section}{1}{\z@}%
        {-4.5ex \@plus -1ex \@minus -.2ex}%
        {1ex \@plus .2ex}%
        {\normalfont\normalsize\bfseries}
    }
    \footnotesize
}

%-------------------------- Bibliography ------------------------------
\usepackage{cite}%Ê¹¶à¸ö²ÎÎÄÖÐ¼äÓÃ--Á¬½Ó
\def\@biblabel#1{#1~}
\renewenvironment{thebibliography}[1]{
    \ifx\@Acknowledgements\@empty\else
    \vskip 3mm
    {\jiuhao\noindent\textbf{Acknowledgements}\quad{\@Acknowledgements}}
    \fi

    \ifx\@Supplements\@empty\else
        \vskip 3mm
        {\jiuhao\noindent\textbf{Supporting information}\quad\@Supplements\quad
        The supporting information is available online at \url{info.scichina.com} and \url{link.springer.com}.
        The supporting materials are published as submitted, without typesetting or editing.
        The responsibility for scientific accuracy and content remains entirely with the authors.}
    \fi

    \section*{\normalsize\refname
        \@mkboth{\jiuhao\refname}{\jiuhao\refname}}%
    \vspace{-3mm}
    \list{\@biblabel{\@arabic\c@enumiv}}{
        \settowidth\labelwidth{\@biblabel{#1}}%
        \leftmargin\labelwidth
        \advance\leftmargin\labelsep
        \@openbib@code
        \usecounter{enumiv}%
        \let\p@enumiv\@empty
        \renewcommand\theenumiv{\@arabic\c@enumiv}
    }
    \itemsep 0ex \parskip 0ex
    \footnotesize\sloppy
}
\renewcommand{\UrlFont}{\selectfont} %Ê¹ÓÃ\url{}Ê¹²ÎÎÄÖÐµÄurl×Ô¶¯¶ÏÐÐ



%-------------------------- Figures and tables ------------------------

\setlength{\floatsep}{12pt plus 2pt minus 2pt}%Ò³Ãæ¶¥²¿/µ×²¿µÄ¸¡¶¯¶ÔÏó¼äµÄ´¹Ö±¾àÀë, È±Ê¡Îª12pt plus 2pt minus 2pt
\setlength{\textfloatsep}{12pt plus 2pt minus 2pt}%Ò³¶¥²¿/µ×²¿µÄ¸¡¶¯¶ÔÏóÓëÎÄ±¾¼ä´¹Ö±¾àÀë, È±Ê¡20pt plus 2pt minus 4pt
\setlength{\intextsep}{12pt plus 2pt minus 2pt}%Ò³ÖÐ¸¡¶¯¶ÔÏóÓëÉÏÏÂ·½ÎÄ±¾¼ä´¹Ö±¾àÀë, È±Ê¡12pt plus 2pt minus 2pt
\setlength{\belowrulesep}{0pt}%ºáÏßºÍÆäÏÂÎÄ×ÖµÄ¼ä¾à
\setlength{\aboverulesep}{0pt}%ºáÏßºÍÆäÉÏÎÄ×ÖµÄ¼ä¾à
\setlength{\doublerulesep}{0.4pt}
\newcommand\Times{\fontfamily{ptm}\selectfont}
\newcommand{\picsize}{\fontsize{8pt}{0.4\baselineskip}\selectfont}
\usepackage[bf,footnotesize,labelsep=quad]{caption}
\usepackage[labelfont={rm,md,up}]{subfig}
\captionsetup[subfloat]{labelformat=simple,captionskip=0pt}
\captionsetup[table]{aboveskip=1mm}
\captionsetup[figure]{aboveskip=3mm}
\captionsetup[algorithm]{font=footnotesize}
\renewcommand{\thesubfigure}{{\picsize\Times(\alph{subfigure})}} %ÕâÁ½ÐÐ¶¨Òå×ÓÍ¼ÔÚÕýÎÄÒýÓÃÊ±µÄlabelÐÎÊ½
\renewcommand{\thesubtable}{{\picsize(\alph{subtable})}} %×Ó±ílabelµÄ×ÖÌåÈÔºÍÕýÎÄÏàÍ¬

%----------------------- Math ---------------------------------
\def\leq{\leqslant}
\def\geq{\geqslant}
\def\le{\leqslant}
\def\ge{\geqslant}
\abovedisplayskip=11pt plus 0pt minus 6pt
\belowdisplayskip=11pt plus 0pt minus 6pt
\newcommand{\set}[1]{\ensuremath{\left\{ #1 \right\}}}%
\newcommand{\Set}[2]{\ensuremath{\left\{ #1 \left| \right. #2 \right\}}}%
\newcommand{\abs}[1]{\ensuremath{\left| #1 \right|}}%
\newcommand{\map}[3]{\ensuremath{#1 : #2 \rightarrow #3}}%
\newcommand{\C}[1]{\ensuremath{\mathcal{#1}}}%
\newcommand{\restrict}[2]{\ensuremath{#1 \left|_{#2}\right.}}%
\newcommand{\NN}{\mathbb{N}^0}
\newcommand{\PN}{\mathbb{N}}
\newcommand{\syn}{\mathbf{S}}
\newcommand{\Syn}{\mathbf{M}}
\allowdisplaybreaks
\setlength{\arraycolsep}{2.0pt}

%--------------------------------- Theorems ---------------------------------
\def\proof{\noindent{\it Proof.}\quad}
\def\th#1{\noindent{\bf #1}\quad}%The common style. Í¨ÓÃÐÎÊ½
\renewcommand{\qedsymbol}{}
\newtheoremstyle{newdefinition}%
    {2pt}% Space above
    {2pt}% Space below
    {\normalfont}% Body font
    {}% Indent amount
    {\bfseries}% Theorem head font
    {.}% Punctuation after theorem head
    {10pt plus 1pt minus 1pt}% Space after theorem head
    {}% Theorem head spec (can be left empty, meaning `normal')
\theoremstyle{newdefinition}%
\newtheorem{assumption}{Assumption}
\newtheorem{corollary}{Corollary}
\newtheorem{definition}{Definition}
\newtheorem{example}{Example}
\newtheorem{lemma}{Lemma}
\newtheorem{problem}{Problem}
\newtheorem{proposition}{Proposition}
\newtheorem{remark}{Remark}
\newtheorem{theorem}{Theorem}

\iffalse
\makeatletter
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt\@xiipt
   \abovedisplayskip 9\p@ \@plus4\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip  \abovedisplayskip
   \let\@listi\@listI}
\makeatother
\fi

%--------------------------------- list ---------------------------------
\renewenvironment{itemize}{
\begin{list}{$\bullet$}{
\labelwidth=4em
\labelsep=0.5em
\leftmargin=0em
\rightmargin=0em
\parsep=\parskip
\itemsep=0em
\topsep=0em
\itemindent=2.1em
}
}{\end{list}}


\endinput
