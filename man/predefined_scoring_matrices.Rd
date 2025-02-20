\name{predefined_scoring_matrices}
\docType{data}

\alias{predefined_scoring_matrices}
\alias{BLOSUM45}
\alias{BLOSUM50}
\alias{BLOSUM62}
\alias{BLOSUM80}
\alias{BLOSUM100}
\alias{PAM30}
\alias{PAM40}
\alias{PAM70}
\alias{PAM120}
\alias{PAM250}


\title{Predefined scoring matrices}

\description{
  Predefined scoring matrices for nucleotide and amino acid alignments.
}

\usage{
data(BLOSUM45)
data(BLOSUM50)
data(BLOSUM62)
data(BLOSUM80)
data(BLOSUM100)
data(PAM30)
data(PAM40)
data(PAM70)
data(PAM120)
data(PAM250)
}

\format{
  The BLOSUM and PAM matrices are square symmetric matrices with integer
  coefficients, whose row and column names are identical and unique: each
  name is a single letter representing a nucleotide or an amino acid.
}

\details{
  The BLOSUM and PAM matrices are not unique. For example, the definition of
  the widely used BLOSUM62 matrix varies depending on the source, and even a
  given source can provide different versions of "BLOSUM62" without keeping
  track of the changes over time. NCBI provides many matrices here
  ftp://ftp.ncbi.nih.gov/blast/matrices/ but their definitions don't match
  those of the matrices bundled with their stand-alone BLAST software
  available here ftp://ftp.ncbi.nih.gov/blast/

  The BLOSUM45, BLOSUM62, BLOSUM80, PAM30 and PAM70 matrices were taken
  from NCBI stand-alone BLAST software.

  The BLOSUM50, BLOSUM100, PAM40, PAM120 and PAM250 matrices were taken
  from ftp://ftp.ncbi.nih.gov/blast/matrices/
}

\author{H. Pagès and P. Aboyoun}

\seealso{
  \code{\link{nucleotideSubstitutionMatrix}},
  \code{\link{pairwiseAlignment}},
  \link{PairwiseAlignments-class},
  \link{DNAString-class},
  \link{AAString-class},
  \link{PhredQuality-class},
  \link{SolexaQuality-class},
  \link{IlluminaQuality-class}
}

\examples{
## Align two amino acid sequences with the BLOSUM62 matrix:
aa1 <- AAString("HXBLVYMGCHFDCXVBEHIKQZ")
aa2 <- AAString("QRNYMYCFQCISGNEYKQN")
pairwiseAlignment(aa1, aa2, substitutionMatrix="BLOSUM62",
                            gapOpening=3, gapExtension=1)

## See how the gap penalty influences the alignment:
pairwiseAlignment(aa1, aa2, substitutionMatrix="BLOSUM62",
                            gapOpening=6, gapExtension=2)

## See how the substitution matrix influences the alignment:
pairwiseAlignment(aa1, aa2, substitutionMatrix="BLOSUM50",
                            gapOpening=3, gapExtension=1)

if (interactive()) {
  ## Compare our BLOSUM62 with BLOSUM62 from
  ## ftp://ftp.ncbi.nih.gov/blast/matrices/:
  data(BLOSUM62)
  BLOSUM62["Q", "Z"]
  file <- "ftp://ftp.ncbi.nih.gov/blast/matrices/BLOSUM62"
  b62 <- as.matrix(read.table(file, check.names=FALSE))
  b62["Q", "Z"]
}
}

\keyword{data}
\keyword{datasets}
