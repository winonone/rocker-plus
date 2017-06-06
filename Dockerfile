FROM rocker/verse:3.4.0

RUN BUILD_DATE=$(TZ="America/Los_Angeles" date -I) \
  && install2.r --error --repos https://mran.microsoft.com/snapshot/${BUILD_DATE} --deps TRUE \
	printr RcppArmadillo foreach matrixStats gridExtra XML \
  && rm -rf /tmp/downloaded_packages/	
  

RUN r -e 'source("https://bioconductor.org/biocLite.R"); \
		biocLite("minfi"); \
		biocLite("BiocParallel"); \
		biocLite("shinyMethyl"); \
		biocLite("missMethyl"); \
		biocLite("DMRcate");'\
&& rm -rf /tmp/downloaded_packages/

	