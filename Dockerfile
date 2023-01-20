ARG image
FROM --platform=linux/amd64 $image as committed

FROM --platform=linux/arm64 340268328991.dkr.ecr.eu-west-2.amazonaws.com/callisto/keycloak:15.0.2
COPY --from=committed /opt/jboss/ /opt/jboss/