select * from sot23.hpp_user
where organization_id in (select organization_id from sot23.hpp_organization
where tin in (select distinct provider_tin
from sot23.mf_pay_eob
where eob_document_id is not null))
