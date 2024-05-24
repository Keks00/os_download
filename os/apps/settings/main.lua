selection = {
    {{"Apps",2},
     {"Info",1},
     {"Update",1}},
    {{"[<<]",1},
     {"Add",1},
     {"Move",1},
     {"Delete","apps.lua", "d"}
    }
}
page = 1
selected = 1
count = 0
background = paintutils.loadImage("os/textures/settings.nfp")
parallel.waitForAll(

    function ()
        routine = coroutine.create(
            function ()
                while true do
                    paintutils.drawImage(background,1,1)
                    for pos,value in pairs(selection[page]) do
                        term.setCursorPos(1,pos*2)
                        if pos == selected then
                            term.setBackgroundColor(colors.black)
                            write(">")
                        else
                            term.setBackgroundColor(colors.gray)
                            write(" ")
                        end
                        term.setCursorPos(math.floor((26-#value[1])/2-1),pos*2)
                        write(" "..value[1].." ")
                        if #value[1] % 2 ~= 0 then write(" ") end
                    end
                    coroutine.yield()
                end
            end
        )
    end,

    function ()
        while true do
            if coroutine.status(routine) == "suspended" then
                term.setCursorPos(26,18)
                term.blit("X","0","e")
            end
            repeat sleep() until coroutine.running()
        end
    end,
    function ()
        while true do
            local _,_,x,y = os.pullEvent("mouse_click")
            if x == 26 and y == 18 then
                shell.exit()
                coroutine.close(routine)
            end
        end
    end,


    function ()
        sleep(0.01)
        coroutine.resume(routine)
        while true do
            local _,key = os.pullEvent("key")
            if key == keys.down and selected < #selection[page] then
                selected = selected + 1
                coroutine.resume(routine)
            elseif key == keys.up and selected > 1 then
                selected = selected - 1
                coroutine.resume(routine)
            elseif key == keys.enter then
                if type(selection[page][selected][2]) == "number" then
                    page = selection[page][selected][2]
                    coroutine.resume(routine)
                else 
                    shell.run("os/apps/settings/menus"..selection[page][selected][2],selection[page][selected][3])
                end
            end
        end
    end
)
