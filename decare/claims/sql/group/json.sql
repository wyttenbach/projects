select * from gim_subgroup_routing
-- The substring of name starting at position 2, length 4 does not contain a letter or a digit
--where NOT (REGEXP_LIKE(substr(name,2,4), '[a-zA-Z0-9]'));
-- The name contains a nonprintable character
where REGEXP_LIKE(name, '[^[:print:]]');
