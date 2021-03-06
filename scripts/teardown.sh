#!/bin/sh
oc delete -f ocp/backend-v1-deployment.yml -n $USERID
oc delete -f ocp/backend-v2-deployment.yml -n $USERID
oc delete -f ocp/backend-service.yml -n $USERID
oc delete -f ocp/frontend-v1-deployment.yml -n $USERID
oc delete -f ocp/frontend-v2-deployment.yml -n $USERID
oc delete -f ocp/frontend-service.yml -n $USERID
oc delete -f ocp/frontend-route.yml -n $USERID
oc delete -f ocp/station-deployment.yml -n $USERID
oc delete -f istio-files/authentication-backend-enable-mtls.yml -n ${USERID}
oc delete -f istio-files/authentication-frontend-enable-mtls.yml -n ${USERID}
oc delete -f istio-files/destination-rule-backend-circuit-breaker-with-pool-ejection.yml -n ${USERID}
oc delete -f istio-files/destination-rule-backend-v1-v2-mtls.yml -n ${USERID}
oc delete -f istio-files/destination-rule-backend-v1-v2.yml -n ${USERID}
oc delete -f istio-files/destination-rule-frontend-mtls.yml -n ${USERID}
oc delete -f istio-files/destination-rule-frontend-v1-v2.mtls.yml -n ${USERID}
oc delete -f istio-files/destination-rule-frontend-v1-v2.yml -n ${USERID}
oc delete -f istio-files/destination-rule-frontend.yml -n ${USERID}
oc delete -f istio-files/egress-serviceentry.yml -n ${USERID}
oc delete -f istio-files/frontend-gateway.yml -n ${USERID}
oc delete -f istio-files/frontend-jwt-authentication.yml -n ${USERID}
oc delete -f istio-files/frontend-rate-limits.yml -n ${USERID}
oc delete -f istio-files/virtual-service-backend-v1-v2-50-50-3s-timeout.yml -n ${USERID}
oc delete -f istio-files/virtual-service-backend-v1-v2-50-50.yml -n ${USERID}
oc delete -f istio-files/virtual-service-backend-v1-v2-80-20.yml -n ${USERID}
oc delete -f istio-files/virtual-service-backend-v1-v2-mirror-to-v3.yml -n ${USERID}
oc delete -f istio-files/virtual-service-backend.yml -n ${USERID}
oc delete -f istio-files/virtual-service-frontend-fault-inject.yml -n ${USERID}
oc delete -f istio-files/virtual-service-frontend-header-foo-bar-to-v1.yml -n ${USERID}
oc delete -f istio-files/virtual-service-frontend.yml -n ${USERID}
scripts/allow-any-mode.sh
