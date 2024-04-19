select * from &sot..GIM_SUBGROUP_PERIOD period, &sot..GIM_SUBGROUP subgrp, &sot..GIM_GROUP grp
where period.subgroup_id = subgrp.subgroup_id
and subgrp.group_id = grp.group_id
and group_number = '&group_number'
and subgroup_number = '&subgroup_number'

