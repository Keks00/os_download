local app = {}

default = {
    {{1,1,1},{"Music","00000","os/textures/icons/music.nfp","os/apps/music/main.lua"}},
    {{1,1,2},{"Settin","ffffff","os/textures/icons/settings.nfp","os/apps/settings/main.lua"}}
    
    }
settings.load(".global_tables")


function app.checkifEmpty()
    app_location = settings.get("app_location")
    if app_location == nil then
        settings.define("app_location")
        settings.set("app_location",default)
        settings.save(".global_tables")
        return true
    end
    return false
end

function app.add(location,title,color,icon,path)

    page = 1
    lines = {}
    
    for line in io.lines(icon) do table.insert(lines,line) end
    
    for i = 1,20 do
        if i <= 6 then
            if #lines[i] ~= 6 then
                error("Icon (x * y) != 6 * 4")
            end
        else
            if lines[i] ~= nil then
                error("Icon (x * y) != 6 * 4")
            end
        end
    end

    

    app_location = settings.get("app_location")
    
    

    local list_location = location[1] + ( location[2] - 1 ) * 3
    if app_location[list_location] ~= nil then
        error("The Location of the selected slot isn't free.")
    end

    local blit = colors.toBlit(color)
    full_blit = string.rep(blit,#title)

    
    

    app_location[list_location] = {{location},{title,full_blit,icon,path}}
    io.close()
    

    

end
return app