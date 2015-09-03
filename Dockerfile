FROM ubuntu:14.04
RUN apt-get update && apt-get -y install python python-pip build-essential
RUN pip install --upgrade pip 
RUN pip install --upgrade virtualenv 
WORKDIR /
RUN [ "/bin/bash", "-c", "virtualenv env; \
source env/bin/activate; \
which python pip; \
pip install --upgrade pip; \
pip install sphinx docutils pygments; " ]
CMD [ "/bin/bash", "-c", "source env/bin/activate; \
cd /couchdb/; \
sphinx-build -a -E -n -b html \
-D version='0' \
-D release='0' \
-D project='Apache CouchDB' \
-D copyright='Apache Software Foundation' \
-d /couchdb/couchdocs/ \
src/ \
/output" ]

