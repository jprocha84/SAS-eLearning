libname CMVINDA '/home/ptz72dl/MDM_CMVIN/in_data';
libname CMVINDW oracle user=CMVIN_OWNER_DW pw=CMVIN_OWNER_DW_2013 path="   (DESCRIPTION =
     (ADDRESS = (PROTOCOL = TCP) (HOST = migbs24-cl.edc.nam.gm.com) (PORT = 1521))
     (CONNECT_DATA =
        (SERVER = DEDICATED)
        (SERVICE_NAME = cmvindw.world)
        (FAILOVER_MODE =
          (TYPE = SELECT)
          (METHOD = BASIC)
          (RETRIES = 5)
          (DELAY = 5)
        )
     )
   )
";
libname CMVINDM oracle user=CMVIN_OWNER_DM pw=CMVIN_OWNER_DM_2013 path="   (DESCRIPTION =
     (ADDRESS = (PROTOCOL = TCP) (HOST = migbs24-cl.edc.nam.gm.com) (PORT = 1521))
     (CONNECT_DATA =
        (SERVER = DEDICATED)
        (SERVICE_NAME = cmvindm.world)
        (FAILOVER_MODE =
          (TYPE = SELECT)
          (METHOD = BASIC)
          (RETRIES = 5)
          (DELAY = 5)
        )
     )
   )
";
libname CMVINOL oracle user=CMVIN_OLAP pw=CMVIN_OLAP_2013 path="   (DESCRIPTION =
     (ADDRESS = (PROTOCOL = TCP) (HOST = migbs24-cl.edc.nam.gm.com) (PORT = 1521))
     (CONNECT_DATA =
        (SERVER = DEDICATED)
        (SERVICE_NAME = cmvindm.world)
        (FAILOVER_MODE =
          (TYPE = SELECT)
          (METHOD = BASIC)
          (RETRIES = 5)
          (DELAY = 5)
        )
     )
   )
";

/* Obtener una Muestra */


