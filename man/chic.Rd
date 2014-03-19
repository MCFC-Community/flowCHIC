\name{chic}
\encoding{UTF-8}
\alias{chic}
\title{Cytometric histogram image comparison}
\description{Detection of changes in complex microbial communities using histogram images}   
\usage{chic(x,y,show_cluster=TRUE,type="p",main="",col_nmds="black",cex=0.6,pos=1,group,
legend_pos="topleft",abiotic,p.max=0.05,col_abiotic="magenta",verbose=FALSE,...)}
\arguments{
\item{x}{Table with overlap results calculated by ImageJ.}
\item{y}{Table with XOR results calculated by ImageJ.}
\item{show_cluster}{logical (default=TRUE). Change to FALSE if no cluster dendrogram shall be plotted.}
\item{type}{Type of the plot (default=\emph{"p"}). The \emph{"p"} indicates points without connecting lines within the plot. 
Only used if \bold{group}=FALSE. For more details type "?points" into R command line.}
\item{main}{Character string used as title of the NMDS plot (default="").}
\item{col_nmds}{Color used for the plotted data points if \bold{group}=FALSE (default=\emph{"black"}).}
\item{cex}{numeric (default=0.6). Character expansion factor. Used for the final size of the characters.}
\item{pos}{Position of the text (default=2). Values of 1, 2, 3 and 4, respectively indicate positions below, 
to the left of, above and to the right of the specified coordinates.}
\item{group}{Table with group assignments. Use only one column. Use the first line as header. 
Assign the samples to groups in the next lines. The order and the number of these lines/groups has to be identical to 
the order and the number of the samples printed in R. Use only integer values in the range from 1 to 25. 
An example of a group file can be inspected with data(Groups).}
\item{legend_pos}{Position of the legend (default=\emph{"topleft"}) if \bold{group}=TRUE. 
For more details type "?legend" into R command line.}
\item{abiotic}{Table with abiotic data. Should be a tab-delimited text file using '.' as decimal delimiter. 
Use one row for one sample and one column for one abiotic parameter. Use the first column for the first parameter 
and the first line as header. The order and the number of the lines has to be identical to the order and the number of the 
samples printed in R.}
\item{p.max}{Decimal number defining the significance level of the abiotic parameters (default=0.05) if \bold{abiotic}=TRUE. 
Only parameters less/equal this value are plotted.}
\item{col_abiotic}{Color used for the plotted abiotic parameters (default=\emph{"magenta"}).}
\item{verbose}{logical (default=FALSE). Do not print additional information. Change to TRUE to print results of the 
metaMDS function and the p-values of the abiotic parameters.}
\item{...}{Additional parameters used for plotting the data points if \bold{group}=FALSE. 
For more details type "?points" into R command line.}
}
\details{
This package is the third part of the \emph{CHIC} analyzing procedure (see References) and is used for 
calculating the similarities found in the histogram images of cytometric data. A dissimilarity matrix is generated 
from the pairwise comparison of histogram images based on part two of the \emph{CHIC} analyzing procedure. 
Ensuing from this matrix nonmetric multidimensional scaling (NMDS) is performed to show the results. 
The NMDS plot is calculated using the metaMDS function of the package "vegan". 
In addition, a cluster analysis is performed to reveal samples with high similarities.
}

\value{The \emph{chic} function calculates a NMDS plot of the samples and an additional cluster dendrogram}

\references{\emph{Christin Koch, Ingo Fetzer, Hauke Harms, and Susann Müller. CHIC - An Automated
Approach for the Detection of Dynamic Variations in Complex Microbial Communities.
Cytometry Part A, 2013.}

\emph{Jari Oksanen, F. Guillaume Blanchet, Roeland Kindt, Pierre Legendre, Peter R. Minchin, R. B.
  O'Hara, Gavin L. Simpson, Peter Solymos, M. Henry H. Stevens and Helene Wagner (2013). vegan:
  Community Ecology Package. R package version 2.0-10. http://CRAN.R-project.org/package=vegan}}
%\note{}
\author{Joachim Schumann
\email{joachim.schumann@ufz.de}, Christin Koch \email{christin.koch@ufz.de}, Ingo Fetzer \email{ingo.fetzer@stockholmresilience.su.se}, 
Susann Müller \email{susann.müller@ufz.de}}
\examples{
require(vegan)

## Plot cluster analysis and NMDS plot of the data saved in the datasets
## Results_overlaps and Results_xor
## Do not plot abiotic parameters or groups
## The number and the order of the samples are printed

data(Results_overlaps)
data(Results_xor)
chic(Results_overlaps,Results_xor)

## Plot additional abiotic parameters
## Change plotting symbols and their color

data(Results_overlaps)
data(Results_xor)
data(Abiotic_data)
chic(Results_overlaps,Results_xor,col_nmds="darkblue",
abiotic=Abiotic_data,pch=7)

## Plot sample groups

data(Results_overlaps)
data(Results_xor)
data(Groups)
chic(Results_overlaps,Results_xor,group=Groups)

## Plot additional abiotic parameters and groups
## Change color of the arrows
## Print results of the metaMDS function and p-values
## of the abiotic parameters

data(Results_overlaps)
data(Results_xor)
data(Groups)
data(Abiotic_data)
chic(Results_overlaps,Results_xor,group=Groups,abiotic=Abiotic_data,
col_abiotic="darkblue",verbose=TRUE)

## Plot additional gate information

data(Results_overlaps)
data(Results_xor)
data(Groups)
data(Abiotic_gates)
chic(Results_overlaps,Results_xor,group=Groups,abiotic=Abiotic_gates,
col_abiotic="darkgreen",verbose=TRUE)
}

\keyword{CHIC,CyBar}
\keyword{file.show(file.path(R.home("doc"),"KEYWORDS"))}
