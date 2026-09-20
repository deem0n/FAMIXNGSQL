# SQL Moose names for v3.0.0

Short `name` values remain PostgreSQL identifiers. `mooseName` is now a derived,
qualified identifier for navigation and lookup. It includes the SQL entity kind,
quoted ownership path, and input type signature for routines. For example:

- `Table:"app"."users"`
- `Column:"app"."users"."id"`
- `Type:"app"."users"` (a distinct naming domain from the table)
- `Routine:"app"."lookup"("pg_catalog"."int4")`

Double quotes inside identifiers are doubled. OUT/TABLE parameters do not identify
an overload; IN, INOUT and variadic parameters do. Trigger routines share the
routine naming domain. Parameter positions preserve signature order.

Names are computed from current ownership and types, avoiding stale cached names
when a schema, owner or type is renamed or a member is reparented. `name` and
PostgreSQL OIDs are unchanged. MSE stores the original names and relations; reloading
reconstructs the same qualified names.

This is a breaking change for scripts using `entityNamed:` with short strings or
persisting old Moose names. Pass an entity's new `mooseName`, or explicitly select
by `name` and schema when intentionally making a contextual lookup. Do not use
short labels as global identifiers.

Unscoped entities, local AST names and synthetic not-null constraints do not claim
a globally unique Moose name. An incomplete routine signature also cannot claim
uniqueness. Duplicate catalog entities should still be diagnosed at import time;
these names do not silently merge objects.
