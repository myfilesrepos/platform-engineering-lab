FROM postgres:15

RUN apt-get update && \
    apt-get install -y postgresql-15-cron && \
    echo "shared_preload_libraries = 'pg_cron'" >> /usr/share/postgresql/postgresql.conf.sample

### ## Um sicherzustellen, dass pg_cron beim Start erkannt wird.
CMD ["postgres", "-c", "shared_preload_libraries=pg_cron"]
