"Use immutable archive dependencies, independent of prebuilt Iceberg checkouts.
 Only affects the disposable CI image."
Iceberg enableMetacelloIntegration: false.
IceRepository registry copy do: #unregister.
