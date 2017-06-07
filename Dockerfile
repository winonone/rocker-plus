FROM rocker/verse:3.4.0

RUN apt-get update \
&& apt-get install -y libudunits2-dev libudunits2-0 libgdal-dev libproj-dev netc
df-bin libnetcdf-dev \
&& apt-get autoremove -y \
&& apt-get autoclean -y \
&& rm -rf /var/lib/apt/lists/* \
&& BUILD_DATE=$(TZ="America/Los_Angeles" date -I) \
&& install2.r --error --repos https://mran.microsoft.com/snapshot/${BUILD_DATE}
\
        printr RcppArmadillo foreach matrixStats gridExtra XML \
        assertr fulltext roxygen2 DT udunits2 units crosstalk png raster rgeos \
        leaflet rticles \
        questionr bookdown citr rcrossref ggedit \
        R6 yaml digest crayon optparse \
&& installGithub.r yihui/xaringan calligross/ggthemeassist mdlincoln/docthis ric
hfitz/storr richfitz/remake  \
&& echo "options(servr.daemon = TRUE)" > /home/rstudio/.Rprofile \
&&  mkdir /home/rstudio/keybindings \
&& r -e 'source("https://bioconductor.org/biocLite.R"); \
                biocLite("minfi"); \
                biocLite("BiocParallel");' \
                biocLite("missMethyl");  \
                biocLite("DMRcate");' \
&& rm -rf /tmp/downloaded_packages/
COPY keybindings/ /home/rstudio/.R/rstudio/keybindings/
