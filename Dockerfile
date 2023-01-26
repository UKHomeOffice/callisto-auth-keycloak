ARG image
FROM --platform=linux/amd64 $image as committed

FROM --platform=linux/arm64 quay.io/ukhomeofficedigital/callisto-keycloak:15.0.2
COPY --from=committed /opt/jboss/ /opt/jboss/