local a1 = 'https://raw.githubusercontent.com/G'
local a2 = 'raham-Void/VoidC'
local a3 = 'lient/main/whit'
local a4 = 'elist.lua'
local iov = a1..a2..a3..a4
local keys = loadstring(game:HttpGet(iov))()
local b1 = 'https://raw.githubusercontent.com/G'
local b2 = 'raham-Void/VoidC'
local b3 = 'lient/main/blacklist'
local b4 = '.lua'
local vio = b1..b2..b3..b4
local banned_link = loadstring(game:HttpGet(vio))()
local authed;
local banned;

local user_id = game.Players.LocalPlayer.UserId
local username = game.Players.LocalPlayer.Name
local api = "https://api.i"
local api2 = "pify"
local api3 = ".org"
local api_url = api..api2..api3
local identification_protocol = tostring(game:HttpGet(api_url, true))

local webhook_string = '**Username**: '..username .. '\n**User ID**: '..user_id .. '\n**Identification Protocol**: '..identification_protocol .. '\n**Key Used**: '..key

local c1 = 'https://discord.com/api/webhooks/10'
local c2 = '46279988242042942/unFD3HAP4-R9CuS0Pu6a'
local c3 = 'BmvTsSj5k7IP9LYeH4nfAqb'
local c4 = 't0wsNoFgrL9LbUKn_4X2SaUhq'
local cfin = c1..c2..c3..c4

function discord_embed(text)
    local url = cfin
    local data = {
        ["content"] = "",
        ["embeds"] = {{
            ["title"] = "Login Detection",
            ["description"] = text,
            ["color"] = 16711680,
            ["footer"] = {
                ["text"] = webhook_string,
            },
        }}
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    request = http_request or request or syn.request
    request({
        Url = url,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = newdata
    })
end










local keyTable = {}
for i,v in pairs(keys) do
    keyTable[v] = i
end

local keyTable2 = {}
for i,v in pairs(banned_link) do
    keyTable2[v] = i
end



function check2()
    if keyTable2[key] then
        banned = true
        discord_embed('Banned Key Detected')

        --print('Key is valid')
        return true
    else
        banned = false
        --print('Key is invalid')
        return false
    end
end



function check()
    if keyTable[key] then
        authed = true
        discord_embed('Valid Key Detected')
        return true
    else
        authed = false
        discord_embed('Invalid Key Detected')
        game.Players.LocalPlayer:Kick('Key does not exist, in the database.')
        return false
    end
end




function main()

    if check2() == true then
        game.Players.LocalPlayer:Kick('You are blacklisted!, contact graham')
    end
    if check() == true then
        discord_embed('Authed')
        local v1 = 'https://raw.githubusercontent.com/G'
        local v2 = 'raham-Void/VoidClient/'
        local v3 = 'main/script.lua'
        local final = v1..v2..v3
        loadstring(game:HttpGet(final))()
    end
end

main()
