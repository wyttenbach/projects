@echo off
@rem PERFORMASURE - START
@rem
@rem set JVM_OPTIONS=***OPTIONAL*** JVM Options ***OPTIONAL***
@rem
@rem set PERFORMASURE_HOME=C:\PerformaSure4.4
@rem
@rem The following settings are based on PERFORMASURE_HOME. Include these lines,
@rem but do not change them.
@rem
call "%PERFORMASURE_HOME%\scripts\preinstrumentor.cmd" "%JAVA_HOME%"
call "%PERFORMASURE_HOME%\scripts\makebootstrappath.cmd" "%JAVA_HOME%"
set PERFORMASURE_OPTIONS=-Xbootclasspath/p:"%PS_BOOTSTRAP_PATH%" -javaagent:"%PERFORMASURE_HOME%\lib\performasure-agent.jar"
@rem
@rem End of this block should be anywhere before the Java command line that starts JBoss
@rem
@rem PERFORMASURE - END
java -server -Xmx512m -XX:MaxPermSize=128m %PERFORMASURE_OPTIONS% -jar oc4j.jar -userThreads
