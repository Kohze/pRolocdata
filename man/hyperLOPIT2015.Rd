\name{hyperLOPIT2015}
\alias{hyperLOPIT2015}
\alias{hyperLOPIT2015ms3r1}
\alias{hyperLOPIT2015ms3r2}
\alias{hyperLOPIT2015ms3r3}
\alias{hyperLOPIT2015ms2}
\alias{hyperLOPIT2015goCC}

\alias{hyperLOPIT2015ms2psm}
\alias{hyperLOPIT2015ms3r1psm}
\alias{hyperLOPIT2015ms3r2psm}


\docType{data}

\title{
  
  Protein and PMS-level hyperLOPIT datasets on Mouse E14TG2a embryonic
  stem cells from Christoforou et al. (2016).
  
}

\description{
  This is a spatial proteomics dataset from a hyperLOPIT experimental
  design on Mouse E14TG2a embryonic stem cells.
}

\usage{
data(hyperLOPIT2015)
data(hyperLOPIT2015ms3r1)
data(hyperLOPIT2015ms3r2)
data(hyperLOPIT2015ms3r3)
data(hyperLOPIT2015ms2)
data(hyperLOPIT2015ms3r1psm)
data(hyperLOPIT2015ms3r2psm)
data(hyperLOPIT2015ms2psm)
}

\format{
  The data is an instance of class \code{MSnSet} from package
  \code{MSnbase}.
}

\details{
  This is a hyperLOPIT experiment. Normalised intensities for proteins
  for TMT 10-plex labelled fractions are available for 3 replicates
  acquired in MS3 mode (\code{hyperLOPIT2015ms3r1},
  \code{hyperLOPIT2015ms3r2} and \code{hyperLOPIT2015ms3r3}) using an
  Orbitrap Fusion mass-spectrometer. The first two replicates have also
  been combined as described in Trotter et al (2010) to generate dataset
  \code{hyperLOPIT2015} to increase organellar resolution. A dataset
  acquired in MS2 mode has also been acquired (\code{hyperLOPIT2015ms2})
  which was also generated using the Orbitrap Fusion and using a TMT
  10-plex experimental design.

  The PSM-level cvs file are available in the \code{extdata} directory
  and have been processed as follows: imported \code{MSnSet} instances
  using \code{readMSnSet2}, PSMs with missing values were filtered out
  with \code{filterNA}, only PSMs with feature variable
  \code{Quan.Usage} \code{"Used"} and a TMT6plex modification were
  retained and the phenoData was matched and assigned from the
  respective protein-level data. Finally, marker proteins are annotated
  based on the combined protein-level data \code{hyperLOPIT2015} and
  reporter tags are normalised using the \code{"sum"} method. The
  processing script is \code{scripts/hyperlopit2015psm.R}.
  
}

\source{  
  The data was generated by A. Christoforou and C. Mulvey in the
  Cambridge Centre for Proteomics.
  \url{http://www.bio.cam.ac.uk/proteomics/}.
}

\references{
  Christoforou A, Mulvey CM, Breckels LM, Hayward PC, Geladaki E, Hurrell T, 
  Naake T, Gatto L, Viner R, Martinez Arias A, Lilley KS. 
  \emph{A draft map of the mouse pluripotent stem cell spatial proteome}
  Nature Communications, Accepted, October 2015
}

\examples{
data(hyperLOPIT2015)
hyperLOPIT2015
pData(hyperLOPIT2015)
head(exprs(hyperLOPIT2015))

data(hyperLOPIT2015ms3r1psm)
x <- combineFeatures(hyperLOPIT2015ms3r1psm,
                     groupBy = fData(hyperLOPIT2015ms3r1psm)$Protein.Group.Accession,
                     fun = median)
library("pRoloc")		     
par(mfrow = c(1, 2))
plot2D(hyperLOPIT2015ms3r1psm, main = "PSM-level")
plot2D(x, main = "Protein-level (using mean)")
}

\keyword{datasets}
