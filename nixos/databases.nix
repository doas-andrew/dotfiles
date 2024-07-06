{ config, pkgs, ... }:
{
    ## Wide column store
    services.cassandra.enable = true;
    systemd.services.cassandra.wantedBy = pkgs.lib.mkForce [];

    ## Needed to run Postgres as a user
    system.activationScripts = {
        postgresqlMkdir = {
            text = "mkdir -p /run/postgresql && chmod o+w /run/postgresql";
            deps = [];
        };
    };
}
