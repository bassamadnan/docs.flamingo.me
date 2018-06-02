# Flaming vs. Idiomatic Go

A few notes where Flamingo currently is not idiomatic Go, and why those decisions were made.

### `flamingo` package, no vendor/VCS prefix

Flamingo currently is not installable via `go get`, this is due to the mono-repository approach,
internal technical dependencies and because it saves work at time.

However, this might change in the futures.

### Flamingo "Framework"

Go has a great standard library for doing web stuff, and a lot of packages/libraries provide
HTTP routing, template rendering, config parsing, etc. etc.
Flamingo tries to be compatible with everything (starting with `http.Handler`) and tries to enforce
as few special/non-idiomatic behaviours as possible, however it is designed for bigger projects
than the usual microservice, with a pluggable module system and facing challenges in web-environments
which other frameworks don't have (for example a lot of Go web-frameworks provide great support for
REST-like url patterns, but they don't integrate too well in a SEO-ish, dynamic infrastructure where
a lot of different functionality needs to be adopted).

After all this is not to be seen as a Framework, rather helping pieces to make your software work.

### Dependency Injection / IOC

While Go itself is trying to make everything visible, Dependency Injection usually adds magic
and hides complexity, and what actually happens. Flamingo tries to keep this as little as possible,
but using the pluggable architecture it is a necessary part of how everything works.

### No MVC

As stated earlier Flamingo is not a Framework, especially not a full MVC framework.

Instead developers are supposed to have as much freedom as possible, therefore opinionated parts are
kept to a minimum.

## Notes:

After all, Flamingo
- Does not generate code.
- Does not cut compatibility with `http.Handler`.
- (Almost) limits reflection to the DI component.
- Tries to have as much as possible in code, and as less as possible in config files.
- Does not use reflection for controller invokation.
- Tries to keep dependencies to the core framework as little as possible.
