Hanami architecture **can host several Hanami (and Rack) applications in the same Ruby process**.

These applications live under `apps/`. Each of them can be a component of our product, such as the user facing web interface, the admin pane, metrics, HTTP API etc..

All these parts are a _delivery mechanism_ to the business logic that lives under `lib/`. This is the place where our models are defined, and interact with each other to compose the **features** that our product provides.

Hanami architecture is heavily inspired by [Clean Architecture][12].
