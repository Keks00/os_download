list = {
{"Cat","music_disc.cat",185},
{"Blocks","music_disc.blocks",345},
{"Chirp","music_disc.chirp",185},
{"Far","music_disc.far",176},
{"Mall","music_disc.mall",197},
{"Mellohi","music_disc.mellohi",96},
{"Stal","music_disc.stal",150},
{"Strad","music_disc.strad",188},
{"Ward","music_disc.ward",251},
{"Wait","music_disc.wait",238},
{"Pigstep","music_disc.pigstep",148},

}
last = -1
function main()
    while true do
        print("playing...")
        speaker = peripheral.wrap("back")
        sleep(0.6)
        --speaker.playSound("entity.panda.death")
        while true do
            math.randomseed(os.time()*120)
            disk_num = math.random(1,11)
            if disk_num ~= last then
                break
            end
        end
        last = disk_num
        for k,v in pairs(list) do 
            if k == disk_num then
                next = v[2]
                name = v[1]
                time = v[3]
            end
        end
        write(name)
        pitch = math.random(90,120)/100
        print("\n Pitch: "..pitch)
        speaker.playSound(next,1,pitch)
        sleep(time/pitch)
        print("next..")
    end 
end

function interface()
    
end

parallel.waitForAny(main)
