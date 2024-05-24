--if pocket then
--    while true do
--        term.clear()
--        term.setCursorPos(1,1)  
--        textutils.slowWrite("Please Enter \nPassword : ")
--        password = read("#")
--        if password == "Keks" then
--            textutils.slowWrite("\nCorrect")
--            break
--        end
--    end
--else
--    term.clear()
--    term.setCursorPos(1,1) 
--    textutils.slowPrint("Unknown Computer detected...\nEnter the correct Key to continue\nor said device will be Bricked")
--    sleep(0.5)
--    term.write("\nManufacture Key : ")    
--    local key read("*")
--    if key == "key" then
--    
--    else 
--        os.shutdown()
--    end 
--end
--os.sleep(1)
 Home = shell.openTab("os/main.lua")
--local console = shell.openTab("shell")

multishell.setTitle(Home,"HOME")
--multishell.setTitle(console," ")

--shell.switchTab(Home)

--shell.exit()
