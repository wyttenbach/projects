rem QA overrides
set dsiframework.accesscontrol.provider.url=opmn:ormi://%QAHOST%:6003:accesscontrol/accesscontrol
rem TODO not sure if we want to redirect crm but otherwise there is a credentials conflict
set dsiframework.bs.provider.url=opmn:ormi://%QAHOST%:6003:crm/crm
set dsiframework.crm.provider.url=opmn:ormi://%QAHOST%:6003:crm/crm
set dsiframework.security.credentials=ora10as
set dsiframework.security.principal=oc4jadmin
set dsiframework.security.provider.url=opmn:ormi://%QAHOST%:6003:accesscontrol/accesscontrol

rem accesscontrol
set dsiframework.ldap.grp.search.base.dn=ou=siteminder,ou=qa,dc=testdecare,dc=com
set fsnavigationweb.flavour=qa

