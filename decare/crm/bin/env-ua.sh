# UA (CRM)
	export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.accesscontrol.provider.url=opmn:ormi://$UAHOST:6003:accesscontrol/accesscontrol"
	export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.security.credentials=ora10as"
	export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.security.principal=oc4jadmin"
	export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.security.provider.url=opmn:ormi://$UAHOST:6003:accesscontrol/accesscontrol"
# TODO not sure if we want to redirect crm but otherwise there is a credentials conflict
    export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.bs.provider.url=opmn:ormi://$UAHOST:6003:crm/crm"
    export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.crm.provider.url=opmn:ormi://$UAHOST:6003:crm/crm"
    export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.security.credentials=ora10as"
    export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.security.principal=oc4jadmin"
    export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.security.provider.url=opmn:ormi://$UAHOST:6003:accesscontrol/accesscontrol"

# UA (accesscontrol)
    export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Ddsiframework.ldap.grp.search.base.dn=ou=siteminder,ou=ua,dc=testdecare,dc=com"
	export OC4J_JVM_ARGS="$OC4J_JVM_ARGS -Dfsnavigationweb.flavour=ua"
