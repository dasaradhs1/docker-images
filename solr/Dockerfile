# OS + Java7
FROM dockerbase/java7

# ENV http_proxy http://user:password@host:port
# ENV https_proxy http://user:password@host:port

# ------------------- SOLR ------------------

ENV SOLR_VERSION 4.10.3
ENV SOLR solr-$SOLR_VERSION

RUN curl --retry 3 http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz | tar -C /opt --extract --gzip
RUN mv /opt/$SOLR /opt/solr

RUN useradd --home-dir /opt/solr --comment "Solr Server" solr

RUN chown -R solr:solr /opt/solr/example

RUN mkdir -p /solr/apps/solr/home

RUN ln -s /opt/solr/dist/ /solr/apps/solr/home/

USER solr

EXPOSE 8983
WORKDIR /opt/solr/example

CMD ["java", "-jar", "start.jar"]
