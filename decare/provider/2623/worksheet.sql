select distinct description
from core.organization_type;

SELECT DISTINCT ws.* 
FROM anthem.W9_SEARCH_VIEW ws 
where tin='411706150';

SELECT DISTINCT ws.*, ot.description FROM anthem.W9_SEARCH_VIEW ws 
 LEFT OUTER JOIN anthem.W9_ORGANIZATION wo ON ws.W9_ID = wo.W9_LEGAL_ENTITY_ID 
 LEFT OUTER JOIN anthem.ORGANIZATION o ON wo.ORGANIZATION_ID = o.ID 
 LEFT OUTER JOIN CORE.ORGANIZATION_TYPE ot ON o.ORGANIZATION_TYPE_CODE = ot.ORGANIZATION_TYPE_CODE 
 LEFT OUTER JOIN anthem.W9_LEGAL_ALIAS wa ON ws.W9_ID = wa.MASTER_ID 
 WHERE NVL(wa.DUPLICATE_ID, ws.W9_ID) = 109521 ORDER BY ws.W9_ID, ws.CLINIC_ID, ws.ORGANIZATION_ID;
 
 SELECT DISTINCT ws.*, ot.description  
 FROM anthem.W9_SEARCH_VIEW ws 
 LEFT OUTER JOIN anthem.W9_ORGANIZATION wo ON ws.W9_ID = wo.W9_LEGAL_ENTITY_ID 
 LEFT OUTER JOIN anthem.ORGANIZATION o ON wo.ORGANIZATION_ID = o.ID 
 LEFT OUTER JOIN CORE.ORGANIZATION_TYPE ot ON o.ORGANIZATION_TYPE_CODE = ot.ORGANIZATION_TYPE_CODE 
 LEFT OUTER JOIN anthem.W9_LEGAL_ALIAS wa ON ws.W9_ID = wa.MASTER_ID 
 WHERE 1=1
 --and large_group_name is not null 
 and ot.description is not null
 ORDER BY ws.W9_ID, ws.CLINIC_ID, ws.ORGANIZATION_ID;
 
 SELECT ws.W9_ID, count(ot.description)
 FROM anthem.W9_SEARCH_VIEW ws 
 LEFT OUTER JOIN anthem.W9_ORGANIZATION wo ON ws.W9_ID = wo.W9_LEGAL_ENTITY_ID 
 LEFT OUTER JOIN anthem.ORGANIZATION o ON wo.ORGANIZATION_ID = o.ID 
 LEFT OUTER JOIN CORE.ORGANIZATION_TYPE ot ON o.ORGANIZATION_TYPE_CODE = ot.ORGANIZATION_TYPE_CODE 
 LEFT OUTER JOIN anthem.W9_LEGAL_ALIAS wa ON ws.W9_ID = wa.MASTER_ID 
 WHERE ot.description is not null
 group by ws.W9_ID
 HAVING count(ot.description) > 1
 order by count(ot.description) desc;
 
 SELECT c.id, count(ot.description)
 FROM anthem.clinic c
 LEFT OUTER JOIN anthem.clinic_w9 ws on ws.clinic_id = c.id
 LEFT OUTER JOIN anthem.W9_ORGANIZATION wo ON ws.W9_ID = wo.W9_LEGAL_ENTITY_ID 
 LEFT OUTER JOIN anthem.ORGANIZATION o ON wo.ORGANIZATION_ID = o.ID 
 LEFT OUTER JOIN CORE.ORGANIZATION_TYPE ot ON o.ORGANIZATION_TYPE_CODE = ot.ORGANIZATION_TYPE_CODE 
 WHERE ot.description is not null
 group by c.id
 --HAVING count(ot.description) > 1
 order by count(ot.description) desc;
 