rem UA overrides
set dsiframework.accesscontrol.provider.url=opmn:ormi://%UAHOST%:6003:accesscontrol/accesscontrol
set dsiframework.security.credentials=ora10as
set dsiframework.security.principal=oc4jadmin
set dsiframework.security.provider.url=opmn:ormi://%UAHOST%:6003:accesscontrol/accesscontrol

rem accesscontrol
set dsiframework.ldap.grp.search.base.dn=ou=siteminder,ou=ua,dc=testdecare,dc=com
set fsnavigationweb.flavour=ua