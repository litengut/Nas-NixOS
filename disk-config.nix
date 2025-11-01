# Example to create a bios compatible gpt partition
{ lib, ... }:
{
  disko.devices = {
    disk = {
      main = {
        device = lib.mkDefault "/dev/sda";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              name = "boot";
              size = "1M";
              type = "EF02";
            };
            esp = {
              name = "ESP";
              size = "500M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              name = "root";
              size = "100%";
              content = {
                type = "lvm_pv";
                vg = "pool";
              };
            };
          };
        };
      };

      # disk1 = {
      #   type = "disk";
      #   device = "/dev/sdb";
      #   content = {
      #     type = "gpt";
      #     partitions = {
      #       zfs = {
      #         size = "100%";
      #         content = {
      #           type = "zfs";
      #           pool = "junk";
      #         };

      #       };
      #     };
      #   };
      # };
      # disk2 = {
      #   type = "disk";
      #   device = "/dev/sdc";
      #   content = {
      #     type = "gpt";
      #     partitions = {
      #       zfs = {
      #         size = "100%";
      #         content = {
      #           type = "zfs";
      #           pool = "junk";
      #         };

      #       };

      #     };
      #   };
      # };
    };
    # zpool = {
    #   junk = {
    #     type = "zpool";
    #     mode = "";
    #     rootFsOptions = {
    #       compression = "zstd";
    #       "com.sun:auto-snapshot" = "true";
    #     };
    #     postCreateHook = "zfs list -t snapshot -H -o name | grep -E '^junk@blank$' || zfs snapshot junk@blank";

    #     datasets = {
    #       "junk" = {
    #         type = "zfs_fs";
    #         mountpoint = "/mnt/junk";

    #       };
    #     };
    #   };
    # };

    lvm_vg = {
      pool = {
        type = "lvm_vg";
        lvs = {
          root = {
            size = "100%FREE";
            content = {
              type = "filesystem";
              format = "ext4";
              mountpoint = "/";
              mountOptions = [
                "defaults"
              ];
            };
          };
        };
      };
    };
  };
}
