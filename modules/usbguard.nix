{ ... }:

{
  services.usbguard = {
    enable = true;
    IPCAllowedUsers = [ "manatad" "root" ];

    rules = ''
      # xHCI Host Controllers (internal USB hubs)
      allow id 1d6b:0002 serial "0000:03:00.3" name "xHCI Host Controller" hash "cmzdizBgI3dt4cFMO8H1QUW3FWqsDSXqkGP5r5XZtEs=" with-interface 09:00:00
      allow id 1d6b:0003 serial "0000:03:00.3" name "xHCI Host Controller" hash "ybdCpI8hAKTuZPGiae8Rsnnz/yuDy+5B18xCIie7aIM=" with-interface 09:00:00
      allow id 1d6b:0002 serial "0000:03:00.4" name "xHCI Host Controller" hash "gLtZ+nN9E5O7lRMfuF98VCUMxsuOLKd9zKAHrd/HBIk=" with-interface 09:00:00
      allow id 1d6b:0003 serial "0000:03:00.4" name "xHCI Host Controller" hash "rFU72GSxB2Xa9yb9Z54WadzY+52Mc5zQ1cUt90UiQfA=" with-interface 09:00:00
      allow id 1d6b:0002 serial "0000:04:00.0" name "xHCI Host Controller" hash "BXm6Ov4dzFbPriLpYudpl67dp9SgJJT5pwPN7LhqJjs=" with-interface 09:00:00

      # USB Hub (1a86:8095)
      allow id 1a86:8095 serial "" name "USB Hub" hash "3gRcUdab+G4l9UGwGB/yuflFwxJZMhQZ24NrMhskTJs=" with-interface 09:00:00

      # Bluetooth Radio (Realtek 0bda:b85d) - hardwired internal
      allow id 0bda:b85d serial "00e04c000001" name "Bluetooth Radio" hash "2nE8m9t35iX9yRO6IEL2TzRVAf3KCsZxP9piGe4xC/U=" with-interface { e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 e0:01:01 }

      # USB to LAN adapter (1a86:e396)
      allow id 1a86:e396 serial "DC045AC8A485" name "USB 10/100 LAN" hash "jIRMU72vrO2Cm5yXG/fojpe9vrr11Q62M9GXCYqN8aA=" with-interface { ff:ff:ff 02:06:00 0a:00:00 0a:00:00 02:0d:00 0a:00:01 0a:00:01 }

      # HP Webcam (05c8:0b10) - hardwired internal
      allow id 05c8:0b10 serial "01.00.00" name "HP True Vision HD Camera" hash "5NP3N9kIoz+qSTb2AKrkmngvZIfKHkpoIFqjWJI4lM0=" with-interface { 0e:01:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 0e:02:01 fe:01:01 }

      # Gaming Keyboard (32c2:0015) - via ORICO hub
      allow id 32c2:0015 serial "No.092-0006-4" name "Gaming Keyboard " hash "bXhjfr0fwarw66HJMtWDpIJe0OQ3UIss+yi6o3DTwVw=" with-interface { 03:01:01 03:00:00 }

      # USB Optical Mouse (30fa:0400) - via ORICO hub
      allow id 30fa:0400 serial "" name "USB Optical Mouse " hash "dnc9VfKy7eeMhBmbn1oKvumjHAxHMUf5OoIfo3MtPiY=" with-interface 03:01:02

            # SanDisk 3.2Gen1 (0781:5591)
      allow id 0781:5591 serial "01018ae3ec0f82ae0fcf85913ed62ced272f4e9ee9c39e6284c7ad934c11b6093de10000000000000000000056ff55e9ff0950009155810745331c4e" name " SanDisk 3.2Gen1" hash "4VWR5wNt59N8dtCL3OVaUCqbnPFjDCYh0A3bDbCFNIs=" with-interface 08:06:50

      # SanDisk Cruzer Blade (0781:5567)
      allow id 0781:5567 serial "00017508101321224909" name "Cruzer Blade" hash "3yUrFTPRoMs2kMbFEAcYnRZPxqNieT9moA2/+Cq6zqQ=" with-interface 08:06:50

      # SanDisk 3.2Gen1 (0781:55b8)
      allow id 0781:55b8 serial "04012f2811c9ee7e0cb37d7a91b33d4e1c5861d82b7cc1259cf3b4f7749b783cd06c0000000000000000000047b415e0ff8e0c18b85581073db2cc11" name " Sandisk 3.2Gen1" hash "HFB3WVjCTdO5DQtX1fJOTLSiBcugDxAUkXEPkag2/58=" with-interface 08:06:50

      # SanDisk 3.2Gen1 (0781:55ad)
      allow id 0781:55ad serial "0401cd2bb32ccae345503428090629f6eee7ecfbf914466337ba4c8b5aa96de9f3c8000000000000000000008e42b47200921b18ad55810799321a11" name " SanDisk 3.2Gen1" hash "B33qt/kgbW9jV8To11DCHF5+hhoBsN6Rp4Hg7hgWjZY=" with-interface 08:06:50

      # OTG MicroSD/SD Card reader (05e3:0751)
      allow id 05e3:0751 serial "" name "USB Storage" hash "zNR+zUn0ym93v361FlHUH5YzvYcQ1nwBk0nBEyXdjY4=" with-interface 08:06:50

      # SSD/HDD Enclosure MING (152d:0578)
      allow id 152d:0578 serial "740100010214" name "MING" hash "4TLZ/yk/zrU14zX0dZm5HdAyV3Voh+Umg4s9grVp2h4=" with-interface { 08:06:50 08:06:62 }

      # LAN to Type-C adapter (1a86:e397)
      allow id 1a86:e397 serial "E04E7AD0CCA7" name "USB 10/100 LAN" hash "wC20GHyyjQKdml0vAizW1N3l0QdoiNe2Paj0fAeMJ8A=" with-interface { ff:ff:ff 02:06:00 0a:00:00 0a:00:00 02:0d:00 0a:00:01 0a:00:01 }

      # Block everything else
      block
    '';
  };
}