FROM rocker/verse:3.6.3

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    lbzip2 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    liblwgeom-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev

RUN install2.r --error \
    RColorBrewer \
    RandomFields \
    RNetCDF \
    classInt \
    deldir \
    gstat \
    hdf5r \
    lidR \
    mapdata \
    maptools \
    mapview \
    ncdf4 \
    proj4 \
    raster \
    rgdal \
    rgeos \
    rlas \
    sf \
    sp \
    spacetime \
    spatstat \
    spdep \
    geoR \
    geosphere \
    spatialEco \
    ## from bioconductor
    && R -e "BiocManager::install('rhdf5', update=FALSE, ask=FALSE)"

RUN R -e "install.packages(pkgs=c('shiny','tidyverse', 'DT', 'plotly', 'tibble','readr','dplyr','shinyWidgets','leaflet','rgdal','spatialEco','RMySQL','pool'), repos='https://cran.rstudio.com/', dependencies=TRUE, Ncpus=6)" 

RUN R -e "install.packages(pkgs=c('leaflet', 'dplyr', 'DT','sf','spatialEco'), repos='https://cloud.r-project.org/', dependencies=TRUE, Ncpus=6)"

RUN mkdir /root/app

COPY R /root/shiny_save

EXPOSE 3838

# RUN dos2unix /usr/bin/shiny-server.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*
CMD ["R", "-e", "shiny::runApp('/root/shiny_save', host='0.0.0.0', port=3838)"]