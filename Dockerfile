ARG image
FROM --platform=linux/amd64 $image as committed

FROM --platform=linux/arm64 tmohdit/keycloak:15.1.1
COPY --from=committed /opt/jboss/ /opt/jboss/