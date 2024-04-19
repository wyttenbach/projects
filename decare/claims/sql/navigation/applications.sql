select distinct
  m.application_order, m.application_vc, app.attribute_1_char as app_name, m.server_port, m.application_context, m.landing_page
from
  fnd_functional_matrix m, fnd_valid_code_child app
where
  1=1 and
  m.application_vc = app.valid_code_child_id(+)
order by m.application_order;

