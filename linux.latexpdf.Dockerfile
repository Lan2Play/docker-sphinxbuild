# escape=`

FROM sphinxdoc/sphinx-latexpdf

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified
ENV Task="make"
ENV MakeCommands="latexpdf"
ENV IntlLangs="de"
ENV IntlOut="build/gettext"
ENV CACHE="FALSE"

LABEL com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://lan2play.de" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Lan2play" `
      org.label-schema.description="Lan2play sphinx build container" `
      org.label-schema.vcs-url="https://github.com/Lan2Play/docker-sphinxbuild"

RUN pip3 install sphinx-intl
COPY /dist /app

WORKDIR /docs

VOLUME /docs

RUN chmod +x /app/linux/*.sh;

CMD ["/app/linux/startscript.sh"]
