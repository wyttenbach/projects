# https://weblogic-wonders.com/decrypt-weblogic-datasource-password/
from weblogic.security.internal import *
from weblogic.security.internal.encryption import *


password = "{AES}0+5YrFk+fD9BFIykr3H+wPsNmPRP/GIOUId7SPqBgNg="
path = "D:/Oracle/Middleware/user_projects/domains/pega7_domain/security"
encryptionService = SerializedSystemIni.getEncryptionService(path)
cService = ClearOrEncryptedService(encryptionService)
print("password: " + cService.decrypt(password))
