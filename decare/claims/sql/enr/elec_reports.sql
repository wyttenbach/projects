SELECT FFC.DESCR,
        FFC.EXTERNAL_DIRECTORY,
        FER.REPORT_VC,
        FER.REPORT_FORMAT_VC
 FROM   FND_FILE_CONFIG FFC,
        FND_EEP_REPORT FER
 WHERE  FFC.FILE_CONFIG_ID = (SELECT DISTINCT FF.FILE_CONFIG_ID
                              FROM   FND_FILE FF
                              WHERE  1=1
                              --and ins_date > trunc(sysdate)
                              and file_id = &&file_id --1678246
                              )
        AND FFC.FILE_CONFIG_ID = FER.FILE_CONFIG_ID (+)
