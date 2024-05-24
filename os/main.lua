local app = require "modules.app"

app.checkifEmpty()
settings.load(".global_tables")

parallel.waitForAll(
    function()

        --Backgound Display
        background = paintutils.loadImage("os/textures/new.nfp")
        paintutils.drawImage(background,1,1)
        --Icon&Name Display
        app.checkifEmpty()
        app_location = settings.get("app_location")
        for k, table_value in pairs(app_location) do
            if table_value ~= nil then
                paintutils.drawImage(paintutils.loadImage(table_value[2][3]), 3 + ( 8 * ( table_value[1][3] - 1 ) ), 2  + ( 6 * ( table_value[1][2] - 1 ) ))   
                lines = {}
                term.setCursorPos( 3 + ( 8 * ( table_value[1][3] - 1 ) ), 5  + ( 6 * ( table_value[1][2] - 1 ) ))
                for line in io.lines(table_value[2][3]) do table.insert(lines,line) end

                term.blit(table_value[2][1],table_value[2][2],string.sub(lines[4],1,#table_value[2][1]))
            end
        end

    end,

    function()
        while true do
            _,_,x,y = os.pullEvent("mouse_click")
            for k,table_value in pairs(settings.get("app_location")) do
                if (3 + ( 8 * ( table_value[1][3] - 1 ) ) <= x and
                    x <= (3 + ( 8 * ( table_value[1][3] - 1 ) ) + 5) and
                    (2  + ( 6 * ( table_value[1][2] - 1 ) )) <= y and
                    y <= 5 + ( 6 * ( table_value[1][2] - 1 ) )) then
                    
                    new_tab = shell.openTab(table_value[2][4])
                    shell.switchTab(new_tab)
                    multishell.setTitle(new_tab,table_value[2][1])
                elseif x == 1 and y == 18 then
                    new_tab = shell.openTab("os/apps/shutdown.lua")
                    shell.switchTab(new_tab)
                    multishell.setTitle(new_tab," ")
                    break
                end
            end
        end
    end
)
