rem PROD overrides (CRM)
set dsiframework.accesscontrol.provider.url=opmn:ormi://%PRODHOST%:6003:accesscontrol/accesscontrol
set dsiframework.security.credentials=ora10as
set dsiframework.security.principal=oc4jadmin
set dsiframework.security.provider.url=opmn:ormi://%PRODHOST%:6003:accesscontrol/accesscontrol

rem PROD overrides (accesscontrol)
set dsiframework.external.ldap.base.dn=dc=decare,dc=com
set dsiframework.external.ldap.search.base.dn=
set dsiframework.external.ldap.credentials=gIl12GQwJkZ5
set dsiframework.external.ldap.initial.context.factory=com.sun.jndi.ldap.LdapCtxFactory
set dsiframework.external.ldap.principal=smadmin
set dsiframework.external.ldap.provider.url=ldap://aether.decare.com:389
set dsiframework.ldap.authorization.type=simple
set dsiframework.ldap.base.dn=dc=decare,dc=com
set dsiframework.ldap.search.base.dn=
set dsiframework.ldap.grp.search.base.dn=ou=siteminder,ou=apps,dc=decare,dc=com
set dsiframework.ldap.credentials=gIl12GQwJkZ5
set dsiframework.ldap.initial.context.factory=com.sun.jndi.ldap.LdapCtxFactory
set dsiframework.ldap.principal=smadmin
set dsiframework.ldap.provider.url=ldap://aether.decare.com:389
set fsnavigationweb.flavour=prod