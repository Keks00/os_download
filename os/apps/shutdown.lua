parallel.waitForAny(
    function ()
        term.setCursorPos(1,1)
        term.write("[PRESS A BUTTON TO CANCEL]\n")
        textutils.slowWrite("Shutting down Computer\n in")
        textutils.slowWrite(" 3 2 1  \n",3)
        term.write("\nGoodbye :)")
        os.sleep(1)
        os.shutdown()
    end,

    function ()
        os.pullEvent("key")
        term.clear()
        term.setCursorPos(1,1)
        term.write("Cancled")
        os.sleep(0.4)
        shell.exit()
    end
)