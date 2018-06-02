# Configuration

## Basics
Configurations are yml files located in **config** folder.

The configuration syntax is to specify areas either with `.` or as yaml maps:

```yaml
foo:
  bar: x
```

is the same as

```yaml
foo.bar: x
```

Configuration can be used (either by the `config()` helper, or via dependency injection.
Asking for either a concrete value via e.g. `foo.bar` is possible, as well as getting a whole `config.Map` instance by a partially-selector, e.g. `foo`.
This would be a Map with element `bar` set to `x`.

Deeply nested config maps can be marshaled into structs for convenience.

The result struct must match exactly the structure and types of the config map and all fields must be exported.

```go
err := m.MarshalTo(&result)
```

There is a root configuration "context.yml".

You can set different CONTEXT with the environment variable *CONTEXT* and this will cause flamingo to load another configuration file.

e.g. starting flamingo with
```
  export CONTEXT="dev" && go run project.go serve
```
Will cause flamingo to load the configfile "config/context_dev.yml"


Configuration values can be read from environment variables with the syntax:

```
  auth.secret: '%%ENV:KEYCLOAK_SECRET%%'
```

## Configuration Context Areas

You can have several configuration areas in your project.

Configuration areas have:
* a name
* a list of modules to load
* a baseurl that will cause flamingo to "detect" and use that configuration area
* child config areas

With the concept of having childs, the config areas in your project can form a tree. Inside the tree most of the configurations and modules are inherited to the childrens.

This concept is mainly used to configure different websites/channels with different locales for example.

## Background informations

Configurations are defined and used by the individual modules. 
The modules should come with a documentation which configurations/featureflags they support.

[Dependency injection](dependency-injection.md) is used to inject configuration values.

