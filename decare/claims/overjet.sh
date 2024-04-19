#!/bin/bash
junction src PR_OVERJET
(cd $WL_DOMAIN; junction config config.opstd)
(cd $WL; junction properties $P/weblogic/properties.d8)
