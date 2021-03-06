--[[Register]]--
RegisterNetEvent('FinishMoneyCheckForVeh')
RegisterNetEvent('vehshop:spawnVehicle')
RegisterNetEvent('vehshop:leftvehicle')
RegisterNetEvent('veh:spawn')
RegisterNetEvent('veh:retrieve')



--[[Local/Global]]--

local vehshop = {
	opened = false,
	title = "Vehicle Shop",
	currentmenu = "main",
	lastmenu = nil,
	currentpos = nil,
	selectedbutton = 0,
	marker = { r = 0, g = 155, b = 255, a = 200, type = 1 },
	menu = {
		x = 0.9,
		y = 0.08,
		width = 0.2,
		height = 0.04,
		buttons = 10,
		from = 1,
		to = 10,
		scale = 0.4,
		font = 0,
		["main"] = {
			title = "CATEGORIES",
			name = "main",
			buttons = {
				{name = "Vehicles", description = ""},
				{name = "Motorcycles", description = ""},
			}
		},
		["vehicles"] = {
			title = "VEHICLES",
			name = "vehicles",
			buttons = {
				{name = "Compacts", description = ''},
				{name = "Coupes", description = ''},
				{name = "Sedans", description = ''},
				{name = "Sports", description = ''},
				{name = "Sports Classics", description = ''},
				{name = "Super", description = ''},
				{name = "Muscle", description = ''},
				{name = "Off-Road", description = ''},
				{name = "SUVs", description = ''},
				{name = "Vans", description = ''},
				{name = "Cycles", description = ''},
			}
		},
		["compacts"] = {
			title = "compacts",
			name = "compacts",
			buttons = {
				{name = "Blista", costs = 20000, description = {}, model = "blista"},
				{name = "Brioso R/A", costs = 35000, description = {}, model = "brioso"},
				{name = "Dilettante", costs = 6000, description = {}, model = "Dilettante"},
				{name = "Issi", costs = 35000, description = {}, model = "issi2"},
				{name = "Panto", costs = 8000, description = {}, model = "panto"},
				{name = "Prairie", costs = 35000, description = {}, model = "prairie"},
				{name = "Rhapsody", costs = 40000, description = {}, model = "rhapsody"},
			}
		},
		["coupes"] = {
			title = "coupes",
			name = "coupes",
			buttons = {
				{name = "Cognoscenti Cabrio", costs = 270000, description = {}, model = "cogcabrio"},
				{name = "Exemplar", costs = 210000, description = {}, model = "exemplar"},
				{name = "F620", costs = 200000, description = {}, model = "f620"},
				{name = "Felon", costs = 150000, description = {}, model = "felon"},
				{name = "Felon GT", costs = 170000, description = {}, model = "felon2"},
				{name = "Jackal", costs = 90000, description = {}, model = "jackal"},
				{name = "Oracle", costs = 80000, description = {}, model = "oracle"},
				{name = "Oracle XS", costs = 85000, description = {}, model = "oracle2"},
				{name = "Sentinel", costs = 110000, description = {}, model = "sentinel2"},
				{name = "Sentinel XS", costs = 130000, description = {}, model = "sentinel"},
				{name = "Windsor", costs = 300000, description = {}, model = "windsor"},
				{name = "Windsor Drop", costs = 400000, description = {}, model = "windsor2"},
				{name = "Zion", costs = 90000, description = {}, model = "zion"},
				{name = "Zion Cabrio", costs = 100000, description = {}, model = "zion2"},
			}
		},
		["sports"] = {
			title = "sports",
			name = "sports",
			buttons = {
				{name = "9F", costs = 300000, description = {}, model = "ninef"},
				{name = "9F Cabrio", costs = 350000, description = {}, model = "ninef2"},
				{name = "Alpha", costs = 275000, description = {}, model = "alpha"},
				{name = "Banshee", costs = 150000, description = {}, model = "banshee"},
				{name = "Bestia GTS", costs = 250000, description = {}, model = "bestiagts"},
				{name = "Buffalo", costs = 90000, description = {}, model = "buffalo"},
				{name = "Buffalo S", costs = 110000, description = {}, model = "buffalo2"},
				{name = "Carbonizzare", costs = 350000, description = {}, model = "carbonizzare"},
				{name = "Comet", costs = 200000, description = {}, model = "comet2"},
				{name = "Coquette", costs = 300000, description = {}, model = "coquette"},
				{name = "Elegy RH8", costs = 200000, description = {}, model = "elegy2"},
				{name = "Feltzer", costs = 270000, description = {}, model = "feltzer2"},
				{name = "Furore GT", costs = 300000, description = {}, model = "furoregt"},
				{name = "Fusilade", costs = 150000, description = {}, model = "fusilade"},
				{name = "Futo", costs = 115000, description = {}, model = "futo"},
				{name = "Jester", costs = 700000, description = {}, model = "jester"},
				{name = "Khamelion", costs = 450000, description = {}, model = "khamelion"},
				{name = "Kuruma", costs = 250000, description = {}, model = "kuruma"},
				{name = "Lynx", costs = 250000, description = {}, model = "lynx"},
				{name = "Massacro", costs = 275000, description = {}, model = "massacro"},
				{name = "Penumbra", costs = 80000, description = {}, model = "penumbra"},
				{name = "Rapid GT", costs = 180000, description = {}, model = "rapidgt"},
				{name = "Rapid GT Convertible", costs = 200000, description = {}, model = "rapidgt2"},
				{name = "Schafter LWB", costs = 250000, description = {}, model = "schafter4"},
				{name = "Schafter V12", costs = 300000, description = {}, model = "schafter3"},
				{name = "Schwarzer", costs = 175000, description = {}, model = "schwarzer"},
				{name = "Seven 70", costs = 700000, description = {}, model = "seven70"},
				{name = "Specter", costs = 500000, description = {}, model = "specter"},
				{name = "Sultan", costs = 210000, description = {}, model = "sultan"},
				{name = "Surano", costs = 375000, description = {}, model = "surano"},
				{name = "Verkierer", costs = 400000, description = {}, model = "verlierer2"},
			}
		},
		["sportsclassics"] = {
			title = "sports classics",
			name = "sportsclassics",
			buttons = {
				{name = "Coquette Classic", costs = 320000, description = {}, model = "coquette2"},
				{name = "Manana", costs = 20000, description = {}, model = "manana"},
				{name = "Peyote", costs = 30000, description = {}, model = "peyote"},
				{name = "Pigalle", costs = 60000, description = {}, model = "pigalle"},
				{name = "Tornado", costs = 25000, description = {}, model = "tornado"},
			}
		},
		["super"] = {
			title = "super",
			name = "super",
			buttons = {
				{name = "811", costs = 705000, description = {}, model = "pfister811"},
				{name = "Adder", costs = 1000000, description = {}, model = "adder"},
				{name = "Bullet", costs = 500000, description = {}, model = "bullet"},
				{name = "Cheetah", costs = 850000, description = {}, model = "cheetah"},
				{name = "Entity XF", costs = 600000, description = {}, model = "entityxf"},
				{name = "FMJ", costs = 900000, description = {}, model = "fmj"},
				{name = "GP1", costs = 900000, description = {}, model = "gp1"},
				{name = "Infernus", costs = 400000, description = {}, model = "infernus"},
				{name = "Itali GTB", costs = 500000, description = {}, model = "italigtb"},
				{name = "Nero", costs = 1500000, description = {}, model = "nero"},
				{name = "Osiris", costs = 1000000, description = {}, model = "osiris"},
				{name = "Penetrator", costs = 1000000, description = {}, model = "penetrator"},
				{name = "Reaper", costs = 600000, description = {}, model = "reaper"},
				{name = "T20", costs = 800000, description = {}, model = "t20"},
				{name = "Tempesta", costs = 800000, description = {}, model = "tempesta"},
				{name = "Turismo R", costs = 900000, description = {}, model = "turismor"},
				{name = "Vacca", costs = 700000, description = {}, model = "vacca"},
				{name = "Vagner", costs = 1000000, description = {}, model = "vagner"},
				{name = "Voltic", costs = 500000, description = {}, model = "voltic"},
				{name = "XA 21", costs = 800000, description = {}, model = "xa21"},
				{name = "Zentorno", costs = 1000000, description = {}, model = "zentorno"},
			}
		},
		["muscle"] = {
			title = "muscle",
			name = "muscle",
			buttons = {
				{name = "Blade", costs = 35000, description = {}, model = "blade"},
				{name = "Buccaneer", costs = 50000, description = {}, model = "buccaneer"},
				{name = "Chino", costs = 40000, description = {}, model = "chino"},
				{name = "Dominator", costs = 70000, description = {}, model = "dominator"},
				{name = "Dukes", costs = 70000, description = {}, model = "dukes"},
				{name = "Faction", costs = 40000, description = {}, model = "faction"},
				{name = "Gauntlet", costs = 75000, description = {}, model = "gauntlet"},
				{name = "Hotknife", costs = 60000, description = {}, model = "hotknife"},
				{name = "Moonbeam", costs = 30000, description = {}, model = "moonbeam"},
				{name = "Phoenix", costs = 50000, description = {}, model = "phoenix"},
				{name = "Picador", costs = 40000, description = {}, model = "picador"},
				{name = "Ruiner", costs = 55000, description = {}, model = "ruiner"},
				{name = "Sabre Turbo", costs = 45000, description = {}, model = "sabregt"},
				{name = "Slam Van", costs = 40000, description = {}, model = "slamvan"},
				{name = "Stalion", costs = 40000, description = {}, model = "stalion"},
				{name = "Tampa", costs = 65000, description = {}, model = "tampa"},
				{name = "Virgo", costs = 65000, description = {}, model = "virgo"},
				{name = "Virgo Classic", costs = 30000, description = {}, model = "virgo2"},
				{name = "Vigero", costs = 50000, description = {}, model = "vigero"},
				{name = "Voodoo", costs = 35000, description = {}, model = "voodoo2"},
			}
		},
		["offroad"] = {
			title = "off-road",
			name = "off-road",
			buttons = {
				{name = "Bifta", costs = 50000, description = {}, model = "bifta"},
				{name = "Blazer", costs = 20000, description = {}, model = "blazer"},
				{name = "Blazer Street", costs = 35000, description = {}, model = "blazer4"},
				{name = "Bodhi", costs = 17000, description = {}, model = "bodhi2"},
				{name = "Brawler", costs = 200000, description = {}, model = "brawler"},
				{name = "Bubsta 6x6", costs = 500000, description = {}, model = "dubsta3"},
				{name = "BF Injection", costs = 25000, description = {}, model = "bfinjection"},
				{name = "Contender", costs = 300000, description = {}, model = "contender"},
				{name = "Kalahari", costs = 30000, description = {}, model = "kalahari"},
				{name = "Mesa", costs = 80000, description = {}, model = "mesa"},
				{name = "Rancher XL", costs = 35000, description = {}, model = "ranhcerxl"},
				{name = "Rebel Rusty", costs = 20000, description = {}, model = "rebel"},
				{name = "Rebel", costs = 40000, description = {}, model = "rebel2"},
				{name = "Sandking XL", costs = 110000, description = {}, model = "sandking"},
			}
		},
		["suvs"] = {
			title = "suvs",
			name = "suvs",
			buttons = {
				{name = "Baller", costs = 50000, description = {}, model = "baller"},
				{name = "Baller LE", costs = 90000, description = {}, model = "baller3"},
				{name = "Baller LE-LWB", costs = 11000, description = {}, model = "baller4"},
				{name = "Beejay XL", costs = 35000, description = {}, model = "bjxl"},
				{name = "Cavalcade", costs = 45000, description = {}, model = "cavalcade"},
				{name = "Cavalcade LE", costs = 85000, description = {}, model = "cavalcade2"},
				{name = "Dubsta", costs = 250000, description = {}, model = "dubsta"},
				{name = "FQ 2", costs = 50000, description = {}, model = "fq2"},
				{name = "Granger", costs = 80000, description = {}, model = "granger"},
				{name = "Gresley", costs = 55000, description = {}, model = "gresley"},
				{name = "Habanero", costs = 35000, description = {}, model = "habanero"},
				{name = "Huntley S", costs = 170000, description = {}, model = "huntley"},
				{name = "Landstalker", costs = 65000, description = {}, model = "landstalker"},
				{name = "Patriot H2", costs = 100000, description = {}, model = "patriot"},
				{name = "Radius", costs = 55000, description = {}, model = "radi"},
				{name = "Rocoto", costs = 80000, description = {}, model = "rocoto"},
				{name = "Seminole", costs = 40000, description = {}, model = "seminole"},
				{name = "Serrano", costs = 80000, description = {}, model = "serrano"},
				{name = "XLS", costs = 100000, description = {}, model = "xls"},
			}
		},
		["vans"] = {
			title = "vans",
			name = "vans",
			buttons = {
				{name = "Bison", costs = 35000, description = {}, model = "bison"},
				{name = "Bobcat XL", costs = 25000, description = {}, model = "bobcatxl"},
				{name = "Burrito", costs = 30000, description = {}, model = "burrito"},
				{name = "Camper", costs = 40000, description = {}, model = "camper"},
				{name = "Journey", costs = 8000, description = {}, model = "journey"},
				{name = "Minivan", costs = 15000, description = {}, model = "minivan"},
				{name = "Paradise", costs = 35000, description = {}, model = "paradise"},
				{name = "Pony", costs = 30000, description = {}, model = "pony"},
				{name = "Rumpo", costs = 25000, description = {}, model = "rumpo"},
				{name = "Speedo", costs = 32500, description = {}, model = "speedo"},
				{name = "Surfer", costs = 40000, description = {}, model = "surfer"},
				{name = "Youga", costs = 30000, description = {}, model = "youga"},
				{name = "Youga Classic", costs = 20000, description = {}, model = "youga2"},
			}
		},
		["sedans"] = {
			title = "sedans",
			name = "sedans",
			buttons = {
				{name = "Asea", costs = 17800, description = {}, model = "asea"},
				{name = "Asterope", costs = 22000, description = {}, model = "asterope"},
				{name = "Cognoscenti", costs = 250000, description = {}, model = "cognoscenti"},
				{name = "Cognoscenti 55", costs = 230000, description = {}, model = "cog55"},
				{name = "Emperor", costs = 10000, description = {}, model = "emperor"},
				{name = "Fugitive", costs = 50000, description = {}, model = "fugitive"},
				{name = "Glendale", costs = 65000, description = {}, model = "glendale"},
				{name = "Ingot", costs = 10000, description = {}, model = "ingot"},
				{name = "Intruder", costs = 45000, description = {}, model = "intruder"},
				{name = "Premier", costs = 20000, description = {}, model = "premier"},
				{name = "Primo", costs = 40000, description = {}, model = "primo"},
				{name = "Regina", costs = 10000, description = {}, model = "regina"},
				{name = "Schafter", costs = 80000, description = {}, model = "schafter2"},
				{name = "Stanier", costs = 10000, description = {}, model = "stanier"},
				{name = "Stratum", costs = 10000, description = {}, model = "stratum"},
				{name = "Super Diamond", costs = 260000, description = {}, model = "superd"},
				{name = "Surge", costs = 22000, description = {}, model = "surge"},
				{name = "Tailgater", costs = 70000, description = {}, model = "tailgater"},
				{name = "Warrener", costs = 65000, description = {}, model = "warrener"},
				{name = "Washington", costs = 25000, description = {}, model = "washington"},
			}
		},
		["motorcycles"] = {
			title = "MOTORCYCLES",
			name = "motorcycles",
			buttons = {
				{name = "Akuma", costs = 24000, description = {}, model = "AKUMA"},
				{name = "Bagger", costs = 32000, description = {}, model = "bagger"},
				{name = "Bati 801", costs = 50000, description = {}, model = "bati"},
				{name = "BF400", costs = 48500, description = {}, model = "bf400"},
				{name = "Carbon RS", costs = 60000, description = {}, model = "carbonrs"},
				{name = "Cliffhanger", costs = 25000, description = {}, model = "cliffhanger"},
				{name = "Daemon", costs = 25000, description = {}, model = "daemon"},
				{name = "Diabolus", costs = 30000, description = {}, model = "diabolus"},
				{name = "Double T", costs = 55000, description = {}, model = "double"},
				{name = "Enduro", costs = 10000, description = {}, model = "enduro"},
				{name = "Faggio", costs = 4000, description = {}, model = "faggio2"},
				{name = "FCR 1000", costs = 30000, description = {}, model = "fcr"},
				{name = "Gargoyle", costs = 30000, description = {}, model = "gargoyle"},
				{name = "Hakuchou", costs = 80000, description = {}, model = "hakuchou"},
				{name = "Hexer", costs = 15000, description = {}, model = "hexer"},
				{name = "Innovation", costs = 14000, description = {}, model = "innovation"},
				{name = "Lectro", costs = 40000, description = {}, model = "lectro"},
				{name = "Manchez", costs = 30000, description = {}, model = "manchez"},
				{name = "Nemesis", costs = 12000, description = {}, model = "nemesis"},
				{name = "Nightblade", costs = 40000, description = {}, model = "nightblade"},
				{name = "PCJ-600", costs = 16000, description = {}, model = "pcj"},
				{name = "Ruffian", costs = 16000, description = {}, model = "ruffian"},
				{name = "Sanchez", costs = 26000, description = {}, model = "sanchez2"},
				{name = "Sanchez KIT", costs = 36000, description = {}, model = "sanchez"},
				{name = "Thrust", costs = 30000, description = {}, model = "thrust"},
				{name = "Vader", costs = 18000, description = {}, model = "vader"},
				{name = "Vindicator", costs = 50000, description = {}, model = "vindicator"},
				{name = "Vortex", costs = 60000, description = {}, model = "vortex"},
				{name = "Wolfsbane", costs = 25000, description = {}, model = "wolfsbane"},
			}
		},
	}
}

local fakecar = {model = '', car = nil}
local vehshop_locations = {{entering = {-33.803,-1102.322,25.422}, inside = {-46.56327,-1097.382,25.99875, 120.1953}, outside = {-31.849,-1090.648,25.998,322.345}}}
local vehshop_blips ={}
local inrangeofvehshop = false
local currentlocation = nil
local boughtcar = false
local vehicle_price = 0
local backlock = false
local firstspawn = 0



--[[Functions]]--

function LocalPed()
	return GetPlayerPed(-1)
end

function drawTxt(text,font,centre,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(centre)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x , y)
end

function IsPlayerInRangeOfVehshop()
	return inrangeofvehshop
end

function ShowVehshopBlips(bool)
	if bool and #vehshop_blips == 0 then
		for station,pos in pairs(vehshop_locations) do
			local loc = pos
			pos = pos.entering
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
			SetBlipSprite(blip,326)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Concessionnaire')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(vehshop_blips, {blip = blip, pos = loc})
		end
		Citizen.CreateThread(function()
			while #vehshop_blips > 0 do
				Citizen.Wait(0)
				local inrange = false
				for i,b in ipairs(vehshop_blips) do
					DrawMarker(1,b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],0,0,0,0,0,0,2.001,2.0001,0.5001,0,155,255,200,0,0,0,0)
					if vehshop.opened == false and IsPedInAnyVehicle(LocalPed(), true) == false and  GetDistanceBetweenCoords(b.pos.entering[1],b.pos.entering[2],b.pos.entering[3],GetEntityCoords(LocalPed())) < 5 then		
						drawTxt('Appuyer sur ~g~Entrée~s~ pour accéder au menu d\'achat',0,1,0.5,0.8,0.6,255,255,255,255)
						currentlocation = b
						inrange = true
					end
				end
				inrangeofvehshop = inrange
			end
		end)
	elseif bool == false and #vehshop_blips > 0 then
		for i,b in ipairs(vehshop_blips) do
			if DoesBlipExist(b.blip) then
				SetBlipAsMissionCreatorBlip(b.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(b.blip))
			end
		end
		vehshop_blips = {}
	end
end

function f(n)
	return n + 0.0001
end

function try(f, catch_f)
	local status, exception = pcall(f)
	if not status then
		catch_f(exception)
	end
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function OpenCreator()
	boughtcar = false
	local ped = LocalPed()
	local pos = currentlocation.pos.inside
	FreezeEntityPosition(ped,true)
	SetEntityVisible(ped,false)
	local g = Citizen.InvokeNative(0xC906A7DAB05C8D2B,pos[1],pos[2],pos[3],Citizen.PointerValueFloat(),0)
	SetEntityCoords(ped,pos[1],pos[2],g)
	SetEntityHeading(ped,pos[4])
	vehshop.currentmenu = "main"
	vehshop.opened = true
	vehshop.selectedbutton = 0
end

function CloseCreator(name, veh, price)
	Citizen.CreateThread(function()
		local ped = LocalPed()
		if not boughtcar then
			local pos = currentlocation.pos.entering
			SetEntityCoords(ped,pos[1],pos[2],pos[3])
			FreezeEntityPosition(ped,false)
			SetEntityVisible(ped,true)
		else			
			local name = name	
			local vehicle = veh
			local price = price		
			local veh = GetVehiclePedIsUsing(ped)
			local model = GetEntityModel(veh)
			local colors = table.pack(GetVehicleColours(veh))
			local extra_colors = table.pack(GetVehicleExtraColours(veh))

			local mods = {}
			for i = 0,24 do
				mods[i] = GetVehicleMod(veh,i)
			end
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
			local pos = currentlocation.pos.outside

			FreezeEntityPosition(ped,false)
			RequestModel(model)
			while not HasModelLoaded(model) do
				Citizen.Wait(0)
			end
			personalvehicle = CreateVehicle(model,pos[1],pos[2],pos[3],pos[4],true,false)
			SetModelAsNoLongerNeeded(model)
			for i,mod in pairs(mods) do
				SetVehicleModKit(personalvehicle,0)
				SetVehicleMod(personalvehicle,i,mod)
			end
			SetVehicleOnGroundProperly(personalvehicle)
			local plate = GetVehicleNumberPlateText(personalvehicle)
			SetVehicleHasBeenOwnedByPlayer(personalvehicle,true)
			local id = NetworkGetNetworkIdFromEntity(personalvehicle)
			SetNetworkIdCanMigrate(id, true)
			-- Citizen.InvokeNative(0x629BFA74418D6239,Citizen.PointerValueIntInitialized(personalvehicle))
			SetVehicleColours(personalvehicle,colors[1],colors[2])
			SetVehicleExtraColours(personalvehicle,extra_colors[1],extra_colors[2])
			TaskWarpPedIntoVehicle(GetPlayerPed(-1),personalvehicle,-1)
			SetEntityVisible(ped,true)			
			local primarycolor = colors[1]
			local secondarycolor = colors[2]	
			local pearlescentcolor = extra_colors[1]
			local wheelcolor = extra_colors[2]
			TriggerServerEvent('BuyForVeh', name, vehicle, price, plate, primarycolor, secondarycolor, pearlescentcolor, wheelcolor)
		end
		vehshop.opened = false
		vehshop.menu.from = 1
		vehshop.menu.to = 10
	end)
end

function drawMenuButton(button,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(button.name)
	if selected then
		DrawRect(x,y,menu.width,menu.height,255,255,255,255)
	else
		DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	end
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function drawMenuInfo(text)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawRect(0.675, 0.95,0.65,0.050,0,0,0,150)
	DrawText(0.365, 0.934)
end

function drawMenuRight(txt,x,y,selected)
	local menu = vehshop.menu
	SetTextFont(menu.font)
	SetTextProportional(0)
	SetTextScale(menu.scale, menu.scale)
	SetTextRightJustify(1)
	if selected then
		SetTextColour(0, 0, 0, 255)
	else
		SetTextColour(255, 255, 255, 255)
	end
	SetTextCentre(0)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawText(x + menu.width/2 - 0.03, y - menu.height/2 + 0.0028)
end

function drawMenuTitle(txt,x,y)
	local menu = vehshop.menu
	SetTextFont(2)
	SetTextProportional(0)
	SetTextScale(0.5, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextEntry("STRING")
	AddTextComponentString(txt)
	DrawRect(x,y,menu.width,menu.height,0,0,0,150)
	DrawText(x - menu.width/2 + 0.005, y - menu.height/2 + 0.0028)
end

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function DoesPlayerHaveVehicle(model,button,y,selected)
		local t = false
		--TODO:check if player own car
		if t then
			drawMenuRight("OWNED",vehshop.menu.x,y,selected)
		else
			drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
		end
end

function stringstarts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function ButtonSelected(button)
	local ped = GetPlayerPed(-1)
	local this = vehshop.currentmenu
	local btn = button.name
	if this == "main" then
		if btn == "Vehicles" then
			OpenMenu('vehicles')
		elseif btn == "Motorcycles" then
			OpenMenu('motorcycles')
		end
	elseif this == "vehicles" then
		if btn == "Sports" then
			OpenMenu('sports')
		elseif btn == "Sedans" then
			OpenMenu('sedans')
		elseif btn == "Compacts" then
			OpenMenu('compacts')
		elseif btn == "Coupes" then
			OpenMenu('coupes')
		elseif btn == "Sports Classics" then
			OpenMenu("sportsclassics")
		elseif btn == "Super" then
			OpenMenu('super')
		elseif btn == "Muscle" then
			OpenMenu('muscle')
		elseif btn == "Off-Road" then
			OpenMenu('offroad')
		elseif btn == "SUVs" then
			OpenMenu('suvs')
		elseif btn == "Vans" then
			OpenMenu('vans')
		end
	elseif this == "compacts" or this == "coupes" or this == "sedans" or this == "sports" or this == "sportsclassics" or this == "super" or this == "muscle" or this == "offroad" or this == "suvs" or this == "vans" or this == "industrial" or this == "cycles" or this == "motorcycles" then
		TriggerServerEvent('CheckMoneyForVeh',button.name, button.model, button.costs)
	end
end

function OpenMenu(menu)
	fakecar = {model = '', car = nil}
	vehshop.lastmenu = vehshop.currentmenu
	if menu == "vehicles" then
		vehshop.lastmenu = "main"
	elseif menu == "bikes"  then
		vehshop.lastmenu = "main"
	elseif menu == 'race_create_objects' then
		vehshop.lastmenu = "main"
	elseif menu == "race_create_objects_spawn" then
		vehshop.lastmenu = "race_create_objects"
	end
	vehshop.menu.from = 1
	vehshop.menu.to = 10
	vehshop.selectedbutton = 0
	vehshop.currentmenu = menu
end

function Back()
	if backlock then
		return
	end
	backlock = true
	if vehshop.currentmenu == "main" then
		CloseCreator()
	elseif vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
		if DoesEntityExist(fakecar.car) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
		end
		fakecar = {model = '', car = nil}
		OpenMenu(vehshop.lastmenu)
	else
		OpenMenu(vehshop.lastmenu)
	end
end

--[[Citizen]]--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(1,201) and IsPlayerInRangeOfVehshop() then
			if vehshop.opened then
				CloseCreator()
			else
				OpenCreator()
			end
		end
		if vehshop.opened then
			local ped = LocalPed()
			local menu = vehshop.menu[vehshop.currentmenu]
			drawTxt(vehshop.title,1,1,vehshop.menu.x,vehshop.menu.y,1.0, 255,255,255,255)
			drawMenuTitle(menu.title, vehshop.menu.x,vehshop.menu.y + 0.08)
			drawTxt(vehshop.selectedbutton.."/"..tablelength(menu.buttons),0,0,vehshop.menu.x + vehshop.menu.width/2 - 0.0385,vehshop.menu.y + 0.067,0.4, 255,255,255,255)
			local y = vehshop.menu.y + 0.12
			buttoncount = tablelength(menu.buttons)
			local selected = false

			for i,button in pairs(menu.buttons) do
				if i >= vehshop.menu.from and i <= vehshop.menu.to then

					if i == vehshop.selectedbutton then
						selected = true
					else
						selected = false
					end
					drawMenuButton(button,vehshop.menu.x,y,selected)
					if button.costs ~= nil then
						if vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
							DoesPlayerHaveVehicle(button.model,button,y,selected)
						else
						drawMenuRight(button.costs.."$",vehshop.menu.x,y,selected)
						end
					end
					y = y + 0.04
					if vehshop.currentmenu == "compacts" or vehshop.currentmenu == "coupes" or vehshop.currentmenu == "sedans" or vehshop.currentmenu == "sports" or vehshop.currentmenu == "sportsclassics" or vehshop.currentmenu == "super" or vehshop.currentmenu == "muscle" or vehshop.currentmenu == "offroad" or vehshop.currentmenu == "suvs" or vehshop.currentmenu == "vans" or vehshop.currentmenu == "industrial" or vehshop.currentmenu == "cycles" or vehshop.currentmenu == "motorcycles" then
						if selected then
							if fakecar.model ~= button.model then
								if DoesEntityExist(fakecar.car) then
									Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(fakecar.car))
								end
								local pos = currentlocation.pos.inside
								local hash = GetHashKey(button.model)
								RequestModel(hash)
								while not HasModelLoaded(hash) do
									Citizen.Wait(0)
									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)

								end
								local veh = CreateVehicle(hash,pos[1],pos[2],pos[3],pos[4],false,false)
								while not DoesEntityExist(veh) do
									Citizen.Wait(0)
									drawTxt("~b~Loading...",0,1,0.5,0.5,1.5,255,255,255,255)
								end
								FreezeEntityPosition(veh,true)
								SetEntityInvincible(veh,true)
								SetVehicleDoorsLocked(veh,4)
								--SetEntityCollision(veh,false,false)
								TaskWarpPedIntoVehicle(LocalPed(),veh,-1)
								for i = 0,24 do
									SetVehicleModKit(veh,0)
									RemoveVehicleMod(veh,i)
								end
								fakecar = { model = button.model, car = veh}
							end
						end
					end
					if selected and IsControlJustPressed(1,201) then
						ButtonSelected(button)
					end
				end
			end
		end
		if vehshop.opened then
			if IsControlJustPressed(1,202) then
				Back()
			end
			if IsControlJustReleased(1,202) then
				backlock = false
			end
			if IsControlJustPressed(1,27) then
				if vehshop.selectedbutton > 1 then
					vehshop.selectedbutton = vehshop.selectedbutton -1
					if buttoncount > 10 and vehshop.selectedbutton < vehshop.menu.from then
						vehshop.menu.from = vehshop.menu.from -1
						vehshop.menu.to = vehshop.menu.to - 1
					end
				end
			end
			if IsControlJustPressed(1,173)then
				if vehshop.selectedbutton < buttoncount then
					vehshop.selectedbutton = vehshop.selectedbutton +1
					if buttoncount > 10 and vehshop.selectedbutton > vehshop.menu.to then
						vehshop.menu.to = vehshop.menu.to + 1
						vehshop.menu.from = vehshop.menu.from + 1
					end
				end
			end
		end

	end
end)

AddEventHandler('FinishMoneyCheckForVeh', function(name, vehicle, price)	
	local name = name
	local vehicle = vehicle
	local price = price
	boughtcar = true
	CloseCreator(name, vehicle, price)
end)

AddEventHandler('vehshop:leftvehicle', function()
	TriggerEvent("pNotify:SendNotification", { type = "info", timeout = 1000, layout = "centerLeft", text = "TEST"})
	local player = GetPlayerPed(-1)
	local posPlayer = GetEntityCoords(player, false)
    local playerX, playerY, playerZ = posPlayer.x, posPlayer.y, posPlayer.z
    local radius = 2.0
    local nearestVeh = GetClosestVehicle(playerX, playerY, playerZ, radius, 0, 19)
    local nearestVehPlate = GetVehicleNumberPlateText(nearestVeh)
    LastPosX, LastPosY, LastPosZ = table.unpack(GetEntityCoords(nearestVeh, true))
    local LastPosH = GetEntityHeading(nearestVeh)
    if nearestVehPlate ~= nil then
        TriggerServerEvent('vehshop:checkveh', nearestVeh, nearestVehPlate, LastPosX, LastPosY, LastPosZ, LastPosH)
    end 
end)

AddEventHandler('veh:spawn', function(vehicle, plate, state, primarycolor, secondarycolor, pearlescentcolor, wheelcolor, lastpos)
  local ToSpawnPos = json.decode(lastpos)
  local X = tonumber(ToSpawnPos[1])
  local Y = tonumber(ToSpawnPos[2])
  local Z = tonumber(ToSpawnPos[3])
  local H = tonumber(ToSpawnPos[4])
  local car = GetHashKey(vehicle)
  local plate = plate
  local state = state
  local primarycolor = tonumber(primarycolor)
  local secondarycolor = tonumber(secondarycolor)
  local pearlescentcolor = tonumber(pearlescentcolor)
  local wheelcolor = tonumber(wheelcolor)
  local playerPed = GetPlayerPed(-1)
  local mods = {}
  for i = 0,24 do
    mods[i] = GetVehicleMod(veh,i)
  end
  RequestModel(car)
  while not HasModelLoaded(car) do
    Citizen.Wait(0)
  end
  local caisseo = GetClosestVehicle(X, Y, Z, 10.001, 0, 19)
  local caisseoplate = GetVehicleNumberPlateText(caisseo)
  --SetNotificationTextEntry("STRING")
  --AddTextComponentString("DB="..plate)
  local isVehiculeInWorld = false
 
  if caisseo ~= 0 and caisseo ~= nil then
    Citizen.Trace("SpawnVeh: un vehicule occupe la place")
    if (caisseoplate ~= plate) then
      Citizen.Trace("SpawnVeh: La plaque est differente on fait spawn les vehicule")
      Citizen.Trace(tostring(caisseoplate) .. "!=" .. tostring(plate))
      X = GetOffsetFromEntityInWorldCoords(caisseo, 2.5, 0, 0)
    else
      Citizen.Trace("SpawnVeh: Il s'agit de votre vehicule")
      isVehiculeInWorld = true
    end
  else
    Citizen.Trace("SpawnVeh: Aucun vehicule trouvé sur la place, creation du vehicule")
  end
 
  if isVehiculeInWorld == false then
    veh = CreateVehicle(car, X, Y, Z, H, true, false)
    for i,mod in pairs(mods) do
      SetVehicleModKit(personalvehicle,0)
      SetVehicleMod(personalvehicle,i,mod)
    end
    SetVehicleNumberPlateText(veh, plate)
    SetVehicleOnGroundProperly(veh)
    SetVehicleHasBeenOwnedByPlayer(veh,true)
    local id = NetworkGetNetworkIdFromEntity(veh)
    SetNetworkIdCanMigrate(id, true)
    SetVehicleColours(veh, primarycolor, secondarycolor)
    SetVehicleExtraColours(veh, pearlescentcolor, wheelcolor)
    SetEntityInvincible(veh, false)
  end
end)

-- Citizen.CreateThread(function()
--     while true do
--         Wait(0)
--         if IsControlJustReleased(1, 38) then
--    --          local player = GetPlayerPed(-1)
-- 			-- local posPlayer = GetEntityCoords(player, false)
--    --  		local playerX, playerY, playerZ = posPlayer.x, posPlayer.y, posPlayer.z
--    --  		local radius = 5.0
--    --  		local nearestVeh = GetClosestVehicle(playerX, playerY, playerZ, radius, 0, 19)
--    --  		local nearestVehPlate = GetVehicleNumberPlateText(nearestVeh)
--    --  		SetNotificationTextEntry("STRING")
--    --  		if nearestVehPlate == nil then
--    --  			AddTextComponentString(nearestVeh)
--    --  		else
--    --      	AddTextComponentString(nearestVehPlate ..":".. nearestVeh)
--    --      	end
--    --       	DrawNotification(false, false)	
--         end
--     end
-- end)

AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		--326 car blip 227 225
		ShowVehshopBlips(true)
		firstspawn = 1
	end
end)

AddEventHandler("playerFirstSpawn", function()
	ShowVehshopBlips(true)
end)

RegisterNetEvent("veh:BlibAfterRestart")
AddEventHandler("veh:BlibAfterRestart", function()
	ShowVehshopBlips(true)
end)

AddEventHandler('vehshop:spawnVehicle', function(v)
	local car = GetHashKey(v)
	local playerPed = GetPlayerPed(-1)
	if playerPed and playerPed ~= -1 then
		RequestModel(car)
		while not HasModelLoaded(car) do
				Citizen.Wait(0)
		end
		local playerCoords = GetEntityCoords(playerPed)
		veh = CreateVehicle(car, playerCoords, 0.0, true, false)
		TaskWarpPedIntoVehicle(playerPed, veh, -1)
		SetEntityInvincible(veh, true)
	end
end)

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		RemoveIpl('v_carshowroom')
		RemoveIpl('shutter_open')
		RemoveIpl('shutter_closed')
		RemoveIpl('shr_int')
		RemoveIpl('csr_inMission')
		RequestIpl('v_carshowroom')
		RequestIpl('shr_int')
		RequestIpl('shutter_closed')
		local utext = "SWAGCLIENT"
		SetNotificationTextEntry("STRING")
         AddTextComponentString(utext)
         DrawNotification(false, false)	
		firstspawn = 1
	end
end)

RegisterNetEvent("veh:test")
AddEventHandler("veh:test", function()
	TriggerServerEvent('vehshop:retrieve')
end)

RegisterNetEvent("veh_s:notif")
AddEventHandler("veh_s:notif", function(text)
	SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)		
end)

--Thread Garage :
local toDeleteVehicle = {}
local isInGarage = false

local function freezePlayer(id, freeze)
    local player = id
    SetPlayerControl(player, not freeze, false)

    local ped = GetPlayerPed(player)

    if not freeze then
        if not IsEntityVisible(ped) then
            SetEntityVisible(ped, true)
        end

        if not IsPedInAnyVehicle(ped) then
            SetEntityCollision(ped, true)
        end

        FreezeEntityPosition(ped, false)
        --SetCharNeverTargetted(ped, false)
        SetPlayerInvincible(player, false)
    else
        if IsEntityVisible(ped) then
            SetEntityVisible(ped, false)
        end

        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        --SetCharNeverTargetted(ped, true)
        SetPlayerInvincible(player, true)
        --RemovePtfxFromPed(ped)

        if not IsPedFatallyInjured(ped) then
            ClearPedTasksImmediately(ped)
        end
    end
end

freezePlayer(PlayerId(), false)

function TpTo(Coords)
		RequestCollisionAtCoord(Coords.x, Coords.y, Coords.z)
		freezePlayer(PlayerId(), true)
		SetEntityCoords(GetPlayerPed(-1), Coords.x, Coords.y, Coords.z, 0, 0, 0, 0)
		SetEntityHeading(GetPlayerPed(-1), Coords.heading)
		while not HasCollisionLoadedAroundEntity(GetPlayerPed(-1)) do
            Citizen.Wait(0)
        end

        ShutdownLoadingScreen()

        DoScreenFadeIn(1500)

        while IsScreenFadingIn() do
            Citizen.Wait(0)
        end
        freezePlayer(PlayerId(), false)
end

function OpenGarageMenu(result)
	ClearMenu()
	MenuTitle = "Gestion Garage"
	print(json.encode(result.garagePoint))
	Menu.addButton("Acheter pour ".. " " ..result.price.."$", "BuyGarage", result.price)
	Menu.addButton("Visiter", "VisitGarage", {garagePoint = result.garagePoint, sortieGarage = result.sortieGarage})
	Menu.addButton("Vendre pour".. " " ..math.ceil(result.price/2).."$", "SellGarage", math.ceil(result.price/2))
	Menu.addButton("Fermer le menu", "CloseMenu", {} )

	Menu.hidden = false
end

function CloseMenu(fake)
	ClearMenu()
	Menu.hidden = true
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if not(Menu.hidden) then
			Menu.renderGUI()
		end

		TriggerEvent("izone:isPlayerInZoneReturnResult", "gestionAchatGarage", function(result)
			if result then
				DisplayHelpText("Appuyez sur ~INPUT_CONTEXT~ pour "..result.displayedMessageInZone)
				if IsControlJustPressed(1, 38) then
					Menu.hidden = not(Menu.hidden)
					if not(Menu.hidden) then
						OpenGarageMenu(result)
					end
				end
			else
				if not(Menu.hidden) then
					CloseMenu("OSEF")
				end
			end
		end)
		TriggerEvent("izone:isPlayerInZoneReturnResult", "sortieGarage", function(result)
			if result then
				local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
				if z<0 then
					if not(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
						DisplayHelpText("Appuyez sur ~INPUT_CONTEXT~ pour "..result.displayedMessageInZone)
						if IsControlJustPressed(1, 38) then
							LeaveGarage(result)
						end
					else
						LeaveGarageWithCar(result, "TODO")
					end
				end
			end
		end)
		TriggerEvent("izone:isPlayerInZoneReturnResult", "entréeGarage", function(result)
			if result then
				if not(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
					DisplayHelpText("Appuyez sur ~INPUT_CONTEXT~ pour "..result.displayedMessageInZone)
					if IsControlJustPressed(1, 38) then
						EnterGarage(result)
					end
				else
					EnterGarageWithCar(result, "TODO")
				end
			end
		end)
	end
end)

function EnterGarage(result)
	TriggerServerEvent("iGarage:playerGotAGarage", result, nil)
end

RegisterNetEvent("iGarage:returnPlayerGotAGarage")
AddEventHandler("iGarage:returnPlayerGotAGarage", function(isGotting, result, cars)
	if isGotting then
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
		end
		isInGarage = true
		TpTo(result.garagePoint)
		if #cars ~= 0 then
			SpawnCars(cars, result)
		end
	end
end)

function EnterGarageWithCar(result, carPlate)
	local myCar = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	local plate = GetVehicleNumberPlateText(myCar)
	TriggerServerEvent("iGarage:playerGotAGarage", result, plate)
end

function LeaveGarage(result)
	for i=1, #toDeleteVehicle do
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(toDeleteVehicle[i], false))
	end
	TpTo(result.finalPoint)
	isInGarage = false
end

function LeaveGarageWithCar(result, carPlate)
	TriggerServerEvent("iGarage:leaveGarageWithCar", result, plate)
	-- faire spawn le véhicle puis le wrap dedans
	-- mettre le véhicle à out
end

RegisterNetEvent("iGarage:returnLeaveGarageWithCar")
AddEventHandler("iGarage:returnLeaveGarageWithCar", function(result, car)
	for i=1, #toDeleteVehicle do
		Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(toDeleteVehicle[i], false))
	end
	TpTo(result.finalPoint)
	SpawnCarOutSide(car, result)
	isInGarage = false
end)

function BuyGarage(garagePrice) -- fonction appelées quand on clique sur le boutton.
	TriggerServerEvent("iGarage:buyCheckForMoney", garagePrice)
end

function VisitGarage(Coords)
	isInGarage = true
	Citizen.CreateThread(function()
		local nowTime = GetGameTimer()
		TriggerEvent("pv:voip", "null")
	
		TpTo(Coords.garagePoint)
		-- on le fait entrer pendant 5 minutes maximum, ou (inclusif) alors quand il se rend sur la zone.
		while isInGarage and (GetGameTimer() <= nowTime + 3000) do
	
			Wait(0)
	
			local playerPed = GetPlayerPed(-1)
	
			for i=0, 32 do
				if i ~= PlayerId() then
					local otherPlayerPed = GetPlayerPed(i)
					SetEntityLocallyInvisible(otherPlayerPed)
					SetEntityNoCollisionEntity(playerPed,  otherPlayerPed,  true)
				end
			end
	
		end
	
		if isInGarage == false then
			TriggerEvent("pNotify:notifyFromServer","Tu viens de sortir du garage, il t'a plut? Achète-le!", "success", "topCenter", true, 5000)
		elseif GetGameTimer() > nowTime + 3000 then
			TriggerEvent("pNotify:notifyFromServer","Le temps est écoulé, la visite t'a plut? N'hésite pas à acheter le garage!", "success", "topCenter", true, 5000)
			TpTo(Coords.sortieGarage)
		end
		TriggerEvent("pv:voip", "default")
	end)
end

function SellGarage(garageSellingPrice)
	TriggerServerEvent("sellCheckForGotting", garageSellingPrice)
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("izio:spawnCar") -- Débugg
AddEventHandler("izio:spawnCar", function(plate, model)
	RequestModel(GetHashKey(model))
	
  	while not HasModelLoaded(GetHashKey(model)) do
  	  Citizen.Wait(0)
  	end
  	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
  	local heading = GetEntityHeading(GetPlayerPed(-1))
	veh = CreateVehicle(GetHashKey(model), x, y, z, heading, true, false) --
	SetVehicleNumberPlateText(veh, plate)
    SetVehicleOnGroundProperly(veh)
    SetVehicleColours(veh, 24, 0)
end)

function SpawnCars(cars, result)
	for i = 1, #cars do
		vehicle = cars[i].model
		plate = cars[i].plate
		primarycolor = cars[i].colorprimary
		secondarycolor = cars[i].colorsecondary
		pearlescentcolor = cars[i].pearlescentcolor
		wheelcolor = cars[i].wheelcolor
		lastpos = result.spawnPointCar[i]

  		local X = tonumber(lastpos.x)
  		local Y = tonumber(lastpos.y)
  		local Z = tonumber(lastpos.z)
  		local H = tonumber(lastpos.heading)

  		local car = GetHashKey(vehicle)
  		local mods = {}
	
  		RequestModel(car)
	
  		while not HasModelLoaded(car) do
  		  Citizen.Wait(0)
  		end

	
  		veh = CreateVehicle(car, X, Y, Z, H, false, false)
  		table.insert(toDeleteVehicle, veh)

  		for i = 0,24 do
  		  mods[i] = GetVehicleMod(veh,i)
  		end

    	for i,mod in pairs(mods) do
    	  SetVehicleModKit(veh,0)
    	  SetVehicleMod(veh,i,mod)
    	end
		
    	SetVehicleNumberPlateText(veh, plate)
    	SetVehicleOnGroundProperly(veh)

    	SetVehicleColours(veh, primarycolor, secondarycolor)
    	SetVehicleExtraColours(veh, pearlescentcolor, wheelcolor)
    end
end

function SpawnCarOutSide(car, result)
	vehicle = car.model
	plate = car.plate
	primarycolor = car.colorprimary
	secondarycolor = car.colorsecondary
	pearlescentcolor = car.pearlescentcolor
	wheelcolor = car.wheelcolor
	lastpos = result.finalPoint

	print(vehicle)
	print(plate)
	print(json.encode(lastpos))
  	local X = tonumber(lastpos.x)
  	local Y = tonumber(lastpos.y)
  	local Z = tonumber(lastpos.z)
  	local H = tonumber(lastpos.heading)


  	local modelHash = GetHashKey(vehicle)
  	local mods = {}

  	RequestModel(modelHash)

  	while not HasModelLoaded(modelHash) do
  	  Citizen.Wait(0)
  	end

  	veh = CreateVehicle(modelHash, X, Y, Z, H, true, false)
  	for i = 0,24 do
  	  mods[i] = GetVehicleMod(veh,i)
  	end
    for i,mod in pairs(mods) do
      SetVehicleModKit(veh,0)
      SetVehicleMod(veh,i,mod)
    end

    local netid = NetworkGetNetworkIdFromEntity(veh)

	SetVehicleHasBeenOwnedByPlayer(veh,true)
	SetNetworkIdCanMigrate(netid, true)

	TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)

	SetEntityInvincible(veh, false)
	SetEntityAsMissionEntity(veh, true, true)

    SetVehicleNumberPlateText(veh, plate)
    SetVehicleOnGroundProperly(veh)

    SetVehicleColours(veh, primarycolor, secondarycolor)
    SetVehicleExtraColours(veh, pearlescentcolor, wheelcolor)
end