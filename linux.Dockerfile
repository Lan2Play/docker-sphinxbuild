# escape=`

FROM sphinxdoc/sphinx

ARG BUILDNODE=unspecified
ARG SOURCE_COMMIT=unspecified
ENV MakeCommands="html"

LABEL com.lacledeslan.build-node=$BUILDNODE `
      org.label-schema.schema-version="1.0" `
      org.label-schema.url="https://lan2play.de" `
      org.label-schema.vcs-ref=$SOURCE_COMMIT `
      org.label-schema.vendor="Lan2play" `
      org.label-schema.description="Lan2play sphinx build container" `
      org.label-schema.vcs-url="https://github.com/Lan2Play/docker-sphinxbuild"

COPY /dist /app

WORKDIR /docs

VOLUME /docs

RUN chmod +x /app/linux/*.sh;

CMD ["/app/linux/buildscript.sh"]