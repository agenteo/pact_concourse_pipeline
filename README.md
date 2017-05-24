# Consumer Driven tests concouse pipeline

This is an example concourse pipeline with consumer driven tests.

**A real application will have more pipelines/jobs but this one remains focused on the API contract.**
 
## Simplified example explained

In this simplified example adapted from a real live application the **travel offers** Spring Boot web application
aggregates travel offers from the **SEAL API** a legacy Sinatra/Ruby app.

[Travel offers](https://github.com/agenteo/spring-boot-pact-consumer) is a the name of the **API consumer** that tests the interaction
with the **API provider** [SEAL API](https://github.com/agenteo/ruby-sinatra-pact-provider). If that contract test passes it will
generate a JSON PACT file and the pipeline will upload it to a [contract git repository](https://github.com/agenteo/pact-repository). There is only one PACT file in this simplified example.

The pipeline will monitor the contract repository. When a new one is published it will run the API provider tests.
 

## Alternatives

You can share contracts with a [broker](https://docs.pact.io/documentation/sharings_pacts.html) instead of using the pipeline.