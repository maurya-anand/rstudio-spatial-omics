FROM rocker/rstudio:4.4

LABEL org.opencontainers.image.source https://github.com/maurya-anand/rstudio-spatial-omics

RUN apt-get update \
    && apt-get install -yq --no-install-recommends build-essential curl wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && R -e 'install.packages("BiocManager", repos="https://cran.rstudio.com")' \
    && R -e "BiocManager::install(c('devtools', 'tidyverse', 'markdown', 'rmarkdown','reshape2', 'quarto', 'palmerpenguins', 'bandle', 'pRoloc', 'pRolocdata', 'pheatmap', 'viridis'))"