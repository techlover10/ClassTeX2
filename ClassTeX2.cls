% Custom class for taking notes in LaTeX
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ClassTeX2}

%%%%%%%%%%%%% Package Imports and Basic Setup %%%%%%%%%%%

%Font option: comment out this line for traditional LaTeX font
%Sans-serif used for a friendlier note-taking font by default.
%Optional command \tradstyle at beginning of document to enable
%traditional LaTeX style.
\gdef\@notestyle{\sfdefault}
\renewcommand{\familydefault}{\@notestyle}
\LoadClass{article}
\RequirePackage{fancyhdr}
\RequirePackage[letterpaper,margin=1in]{geometry}
\RequirePackage{wrapfig}
\RequirePackage{fancybox}
\RequirePackage{ragged2e}
\RequirePackage{mathtools}
\RequirePackage{parskip}
\RequirePackage{graphicx}
\RaggedRight
\newcommand{\tradstyle}{\gdef\@notestyle{\rmdefault}}



%%%%%%%%%% Default Note Header Values %%%%%%%%%%%%%%%%%%%
\gdef\@namecaption{Notes taken by: }
\gdef\@datecaption{Lecture Date: }

%%%%%%%%%%%%% HW Mode Header Values %%%%%%%%%%%%%%%%%%%%%
\newcommand{\hwmode}{\gdef\@namecaption{}  \gdef\@datecaption{}}

%%%%%%%%%%%%%%%%%% Header Setup %%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\@maketitle{
	\begin{minipage}{.65\linewidth}
		{\Huge\@classname}
	\end{minipage}\begin{minipage}{.35\linewidth}
	\shadowbox{\parbox{5cm}{
			\@namecaption \@notetaker\ \\ 
			\@classnum\@semester\ \\
			\@datecaption \@lecdate}}
	\vspace{10pt}
\end{minipage}				 
\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}
\vspace{-15pt}
\bigskip
}

%%%%%%%%%%%%%%%% Commands and Variable Setup %%%%%%%%%%%%

\fancypagestyle{plain}{\fancyhead{}
	\renewcommand\headrulewidth{0pt}
	\renewcommand\footrulewidth{0.3pt}
	\rfoot{\scriptsize{\thepage/\pageref{LastPage}}}\lfoot{\small{\@univ}}}

\newcommand\notetaker[1]{\gdef\@notetaker{#1}}
\newcommand\classname[1]{\gdef\@classname{#1}}
\newcommand\lecdate[1]{\gdef\@lecdate{#1}}
\newcommand\semester[1]{\gdef\@semester{, #1}}
\newcommand\classnum[1]{\gdef\@classnum{#1}}
\newcommand\lectopic[1]{\gdef\@lectopic{#1}}
\newcommand\univ[1]{\gdef\@univ{#1}}

%Command for the ClassTeX "logo"
\newcommand{\ClassTeX}{Class\TeX2}

%Optional commands for more specific things
\gdef\@lectopic{Lecture Notes}
\gdef\@semester{}
\gdef\@univ{}

%%%%%%%%%%%%%%% Proof, Section, Math shortcuts%%%%%%%%%%%%%%

\newcommand\proof[0]{\textbf{Proof: }}
\newcommand\analysis[0]{\textbf{Analysis: }}
\newcommand\basecase[0]{\emph{Base Case: }}
\newcommand\inductivestep[0]{\emph{Inductive Step: }}
\newcommand\ih[0]{\emph{Inductive Hypothesis: }}
\newcommand\runtimeproof[0]{\textbf{Proof of Runtime: }}
\newcommand\correctnessproof[0]{\textbf{Proof of Correctness: }}
\newcommand\secbr[0]{\vspace{0.4cm}\\}
\newcommand\question[0]{\textbf{Question: }}
\newcommand\answer[0]{\textbf{Answer: }}
\newcommand\claim[0]{\textbf{Claim: }}
\newcommand\qa[2]{\textbf{Question: }#1 \\ \vspace{0.3cm} \textbf{Answer: }#2 \vspace{0.3cm}}
\newcommand\divline[0]{\\ \noindent\rule{\linewidth}{0.4pt}\\}

%Note: Assumes math environment
\newcommand\ddx[0]{\frac{d}{dx}}
\newcommand\pdev[0]{\frac{\delta}{\delta x}}



%%%%%%%%%%%%%% Note Box Command Setup %%%%%%%%%%%%%%%%%%%
\newcommand\minornoteleft[2]{
	\begin{wrapfigure}{l}{0.35\textwidth}
		\vspace{-0.5cm}
		\begin{minipage}{0.35\textwidth}
			\framebox{\parbox{5cm}{\normalsize \textbf{#1}\\#2}}
		\end{minipage}
		\vspace{-0.4cm}
	\end{wrapfigure}}
	
\newcommand\minornoteright[2]{
	\begin{wrapfigure}{r}{0.35\textwidth}
		\vspace{-0.5cm}
		\begin{minipage}{0.35\textwidth}
			\framebox{\parbox{5cm}{\normalsize \textbf{#1}\\#2}}
		\end{minipage}
		\vspace{-0.4cm}
	\end{wrapfigure}}
	
\newcommand\importantnote[2]{
	\vspace{-0.4cm}
	\begin{center}
		\framebox{\parbox{\textwidth}{\normalsize \textbf{#1}\\#2}}
	\end{center}
	\vspace{-0.0cm}}
		
%%%%%%%%%%%% Error Messages for Required Commands %%%%%%%
\gdef\@notetaker{\ClassError{ClassTeX}{No \noexpand\notetaker given. You must specify your name using the command \noexpand\notetaker{your name}}}
\gdef\@classnum{\ClassError{ClassTeX}{No \noexpand\classnum given. You must specify the number of the class (ex. CS 2XXX) using the command \noexpand\classnum{Class Number}}}
\gdef\@lecdate{\ClassError{ClassTeX}{No \noexpand\lecdate given.  You must specify the date of this lecture using the command \noexpand\lecdate{lecture date}}}
\gdef\@classname{\ClassError{ClassTeX}{No \noexpand \classname given.  You must specify the name of this class (e.g. Intro to Quantom Bogosort) using the command \noexpand\classname{Class Name}}}

%%%%%%%%%%%%% Page Setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\pagestyle{fancy}
\fancyhf{}
\renewcommand\headrulewidth{0.3pt}
\renewcommand\footrulewidth{0.3pt}
\lhead{\small{\@classnum}}
\chead{\small{\@classname \ -- \@lecdate}}
\rhead{\small{\@lectopic}}
\rfoot{\scriptsize{\thepage/\pageref{LastPage}}}
\lfoot{\small{\@univ}}
\newlength{\oldleftmargini}
\AtEndDocument{\label{LastPage}}


		
