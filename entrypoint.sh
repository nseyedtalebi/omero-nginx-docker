#!/usr/bin/env /bin/bash

set -eu

OMEROWEBHOST=${OMEROWEBHOST:-web}
OMERO_MS_THUMBNAIL_BACKEND_HOST=${OMERO_MS_THUMBNAIL_BACKEND_HOST:-}
OMERO_MS_IMAGE_REGION_BACKEND_HOST=${OMERO_MS_IMAGE_REGION_BACKEND_HOST:-}

sed -i -re "s/(server )[a-zA-Z0-9][a-zA-Z0-9.-]*[a-zA-Z0-9](:4080 fail_timeout=0;)/\1$OMEROWEBHOST\2/" /etc/nginx/conf.d/omero-web.conf
sed -i -re 's/warn/debug/' /etc/nginx/nginx.conf

nginx -g 'daemon off;'
