# Service Mesh Monitoring with Kiali Lab
Monitor your Istio service mesh with Kiali

## Review Service Mesh Monitoring
At some point when you are developing your microservices architecture, you may want to visualize what is happening in your service mesh. You may have questions like “Which service is connected to which other service?” and “How much traffic goes to each microservice?” But because of the loosely tied nature of microservices architectures, these questions can be difficult to answer.

Those are the kinds of question that Kiali has the ability to answer—by giving you a big picture of the mesh and showing the whole flow of your requests and data.

## Explore Kiali

Kiali taps into the data provided by Istio and OpenShift® Container Platform to generate its visualizations. It fetches ingress data (such as request tracing with Jaeger), the listing and data of the services, health indexes, and so on.

Kiali runs as a service together with Istio, and does not require any changes to Istio or OpenShift Container Platform configuration (besides the ones required to install Istio).

Get the URL of the Kiali web console and set as an environment variable:

```
export KIALI_URL=https://$(oc get route kiali -n istio-system -o template --template='{{.spec.host}}')
# Display the KIALI_URL URL:
echo $KIALI_URL
```

Kiali Login screen
![Kiali Login](../images/kiali-login.png)

## Generate Sample Data


## View Service Graph

Move back to the Kiali web console. In the main console select your project. Then in the left-hand panel, Click Graph.
![Kiali Main Screen](../images/kiali-main-screen.png)

On the Graph screen, Select version graph and enable animation
![Kiali set graph](../images/kiali-show-animation.png)

To show the capabilities of Kiali, you need to generate some sample data. For this, you can use the microservices application that you deployed earlier.

Run following command on your terminal
```
scripts/run-50.sh
```

Expect to see traffic animation on the graph based on traffic that is generated by the [scripts/run-50.sh](../scripts/run-50.sh) script you started earlier:

![Kiali Graph](../images/kiali-graph.png)

Remark that on the right of the screen show the result of requests (OK, 3xx, 4xx, 5xx)

# Explore Service Listing
In the left-hand panel, click Services.

On the Services page you can view a listing of the services that are running in the cluster, and additional information about them such as health status.

![Kiali Service](../images/kiali-service.png)

Remark: There is "Istio Config" in the left-hand panel. This can use for display and configure Istio policy. You can check this out in later labs

# Distributed Tracing

Jaeger implement OpenTracing for tracing microservices. Sampling rate and data store of Jaeger Get the URL of the Jaeger Web console and set as an environment variable:

```
export JAEGER_URL=https://$(oc get route jaeger -n istio-system -o template --template='{{.spec.host}}')
# Display the JAEGER_URL URL:
echo $JAEGER_URL
```

Test Jaeger by input search criteria with Service name "frontend.<project>" and set operation to backend service

![Jager Main Screen](../images/jaeger-main-screen.png)

You can drill down to each transaction

![Jaeger Drill Down](../images/jaeger-drill-down.png)


Jaeger can be accessed via Kiali by left-hand panel Distributed Tracing

![Kiali Distributed Tracing](../images/kiali-distributed-tracing.png)