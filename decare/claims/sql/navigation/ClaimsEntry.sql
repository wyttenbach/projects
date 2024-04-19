select * from fnd_functional_matrix
where 1=1
--and application_context like '/claims%'
and application_vc=39811
--and function_vc is null
--and function_vc in (select valid_code_child_id from fnd_valid_code_child where attribute_1_char = 'Claims Entry')
