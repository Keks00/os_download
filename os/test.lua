local rsa = require "modules.decryption"
write("gen_key? ")
if read() == "y" then
   rsa.genKey(true)
end
string = "Hello Blah Blah Blah 123456789 Hall�chen test test test 123 moin :) was soll hier noch hin? keine ahnung mir aber auch egal"
local encrypted_msg = rsa.encrypt(string)
print(rsa.decrypt(encrypted_msg))
