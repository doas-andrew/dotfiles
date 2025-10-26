{ config, pkgs, ... }:
{
    services.cassandra.enable = true;
    systemd.services.cassandra.wantedBy = pkgs.lib.mkForce [];

    services.postgresql.enable = true;
    systemd.services.postgresql.wantedBy = pkgs.lib.mkForce [];
}
