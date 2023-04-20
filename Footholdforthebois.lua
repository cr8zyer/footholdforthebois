function merge(tbls)
	local res = {}
	for i,v in ipairs(tbls) do
		for i2,v2 in ipairs(v) do
			table.insert(res,v2)
		end
	end

	return res
end

function allExcept(tbls, except)
	local tomerge = {}
	for i,v in pairs(tbls) do
		if i~=except then
			table.insert(tomerge, v)
		end
	end
	return merge(tomerge)
end

upgrades = {
	carrier = {
		blue = {'blueShip'},
		red = {'redShipS'}
	},
	ships = {
		blue = {'blueShip','blueShip','blueShip'},
		red = {'redShipS','redShipS','redShipM','redShipM','redShipL','redShipL'}
	},
	airfield = {
		blue = {'blue-AAA', 'blue-Shorad', 'samBlue-Hawk'},
		red = {'red-AAA', 'red-Shorad', 'samRed-SA-11'}
    },
	mediumAirfield = {
		blue = {'blue-AAA', 'blue-Shorad', 'blue-NASAMS', 'ewBlue-117', 'samBlue-HawkHeavy', },
		red = {'red-AAA', 'red-Shorad', 'red-SA-6', 'ewRed-TallRack', 'samRed-SA-11Heavy', }
    },
    largeAirfield = {
		blue = {'blue-Shorad', 'blue-Shorad', 'blue-NASAMS', 'ewBlue-117', 'samBlue-Hawk', 'samBlue-Patriot'},
		red = {'red-Shorad', 'red-Shorad', 'red-SA-6', 'ewRed-TallRack', 'samRed-SA-11', 'samRed-SA-10'}
    },
	lorad = {
		blue = {'ewBlue-117', 'samBlue-Hawk', 'samBlue-Patriot', 'blue-Bunkers'},
		red = {'ewRed-TallRack', 'samRed-SA-11', 'samRed-SA-10', 'red-Bunkers'}
	},
	outpost = {
		blue = {'blue-Shorad', 'samBlue-Hawk', 'blue-Bunkers'},
		red = {'red-Shorad', 'samRed-SA-11', 'red-Bunkers'}
	},
	largeOutpost = {
		blue = {'blue-Shorad', 'ewBlue-117', 'blue-NASAMS', 'samBlue-HawkHeavy'},
		red = {'red-Shorad', 'ewRed-TallRack', 'red-SA-6', 'samRed-SA-11Heavy'}
	}
}
-- redInfantry, redArmor, redSHORAD, redMERAD, redLORAD, redPD, redSA5, redEWR
-- insInfantry, insArmor, insSHORAD
-- blueInfantry, blueArmor, blueSHORAD, blueMERAD, blueLORAD, bluePD
-- blueShip
-- redShipS, redShipM, redShipL

flavor = {
	liwaafb = 'WPT 01\n',
	aldhafraafb = 'WPT 02\n',
	alainintl = 'WPT 03\n',
	sohar = 'WPT 04\n',
	alhayer = 'WPT 05\n',
	abudhabiintl = 'WPT 06\n',
	alminhadafb = 'WPT 07\nWPT 08\n',
    fujairahintl = 'WPT 09\n',
    sharjahintl = 'WPT 10\n',
	alhutain = 'WPT 11\n',
    rasalkhaimahintl = 'WPT 12\n',
	khasab = 'WPT 13\n',
	bandarejask= 'WPT 14\n',
	sirabunuayr= 'WPT 15\n',
	abumusaisland = 'WPT 16\n',
	tunbislandafb = 'WPT 17\n',
	bandarlengeh = 'WPT 18\n',
	qeshmisland = 'WPT 19\n',
	alpha = 'WPT 20\nNaval Protection\n',
	substationeast = 'WPT 21\nSubstation East\n',
	bandarabbasintl = 'WPT 22\n',
	lar = 'WPT 23\n',
    substationwest = 'WPT 24\nSubstation West\n',
	shirazintloutskirts = 'WPT 25\n',
	jiroft = 'WPT 26\n',
	kermanoutskirts = 'WPT 27\n',
	shirazintl = 'WPT 28\n',
	kerman = 'WPT 29\n',
    rucarriergroup = 'RU Carrier Group\n',
    uscarriergroup = 'US Carrier Group\n'
}

local filepath = 'Foothold Large PGulf V.5.lua'
if lfs then
	filepath = lfs.writedir()..'/'..filepath
end
bc = BattleCommander:new(filepath, 10, 60)
zones = {
	uscarriergroup = ZoneCommander:new({zone='US Carrier Group', side=2, level=1, upgrades=upgrades.carrier, crates={}, flavorText=flavor.uscarriergroup}), --BLUE CARRIER GROUP
	liwaafb = ZoneCommander:new({zone='Liwa AFB', side=2, level=5, upgrades=upgrades.largeAirfield, crates={}, flavorText=flavor.liwaafb}),--WP01
	aldhafraafb = ZoneCommander:new({zone='Al Dhafra AFB', side=1, level=5, upgrades=upgrades.mediumAirfield, crates={}, flavorText=flavor.aldhafraafb}), --WP02
	alainintl = ZoneCommander:new({zone='Al Ain Intl', side=1, level=3, upgrades=upgrades.mediumAirfield, crates={}, flavorText=flavor.alainintl}),--WP03
	sohar = ZoneCommander:new({zone='Sohar', side=1, level=3, upgrades=upgrades.largeOutpost, crates={}, flavorText=flavor.sohar}), --WP04
	abudhabiintl = ZoneCommander:new({zone='Abu Dhabi Intl', side=1, level=1, upgrades=upgrades.airfield, crates={}, flavorText=flavor.abudhabiintl}), --WP05
	alhayer = ZoneCommander:new({zone='Al Hayer', side=1, level=3, upgrades=upgrades.outpost, crates={}, flavorText=flavor.alhayer, income=0.5}), --WP06
	alminhadafb = ZoneCommander:new({zone='Al Minhad AFB', side=1, level=3, upgrades=upgrades.mediumAirfield, crates={}, flavorText=flavor.alminhadafb}), --WP07
	fujairahintl = ZoneCommander:new({zone='Fujairah Intl', side=1, level=3, upgrades=upgrades.mediumAirfield, crates={}, flavorText=flavor.fujairahintl}), --WP08
	sharjahintl = ZoneCommander:new({zone='Sharjah Intl', side=1, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.sharjahintl}), --WP09
	alhutain = ZoneCommander:new({zone='Al Hutain', side=1, level=3, upgrades=upgrades.outpost, crates={}, flavorText=flavor.alhutain}), --WP10
	rasalkhaimahintl = ZoneCommander:new({zone='Ras Al Khaimah Intl', side=1, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.rasalkhaimahintl}), --WP11
	khasab = ZoneCommander:new({zone='Khasab', side=1, level=5, upgrades=upgrades.mediumAirfield, crates={}, flavorText=flavor.khasab}), --WP12
	bandarejask = ZoneCommander:new({zone='Bandar e Jask', side=1, level=4, upgrades=upgrades.lorad, crates={}, flavorText=flavor.bandarejask}), --WP13
	sirabunuayr = ZoneCommander:new({zone='Sir Abu Nuayr', side=1, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.sirabunuayr}), --WP14
	abumusaisland = ZoneCommander:new({zone='Abu Musa Island', side=1, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.abumusaisland}), --WP15
	tunbislandafb = ZoneCommander:new({zone='Tunb Island AFB', side=1, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.tunbislandafb}), --WP16
	bandarlengeh = ZoneCommander:new({zone='Bandar Lengeh', side=1, level=4, upgrades=upgrades.largeAirfield, crates={}, flavorText=flavor.bandarlengeh}), --WP17
	qeshmisland = ZoneCommander:new({zone='Qeshm Island', side=1, level=4, upgrades=upgrades.mediumAirfield, crates={}, flavorText=flavor.qeshmisland}), --WP18
	bandarabbasintl = ZoneCommander:new({zone='Bandar Abbas Intl', side=1, level=4, upgrades=upgrades.largeAirfield, crates={}, flavorText=flavor.bandarabbasintl}), --WP19
	lar = ZoneCommander:new({zone='Lar', side=1, level=3, upgrades=upgrades.largeOutpost, crates={}, flavorText=flavor.lar}), --WP20
	jiroft = ZoneCommander:new({zone='Jiroft', side=1, level=3, upgrades=upgrades.mediumAirfield, crates={}, flavorText=flavor.jiroft}), --WP21
	shirazintloutskirts = ZoneCommander:new({zone='Shiraz Intl Outskirts', side=1, level=3, upgrades=upgrades.largeOutpost, crates={}, flavorText=flavor.shirazintloutskirts}), --WP22
	shirazintl = ZoneCommander:new({zone='Shiraz Intl', side=1, level=6, upgrades=upgrades.largeAirfield, crates={}, flavorText=flavor.shirazintl}), --WP23
	kermanoutskirts = ZoneCommander:new({zone='Kerman Outskirts', side=1, level=4, upgrades=upgrades.largeOutpost, crates={}, flavorText=flavor.kermanoutskirts}), --WP24
	kerman = ZoneCommander:new({zone='Kerman', side=1, level=6, upgrades=upgrades.largeAirfield, crates={}, flavorText=flavor.kerman}),--WP25
	substationeast = ZoneCommander:new({zone='Substation East', side=1, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.substationeast}),
	substationwest = ZoneCommander:new({zone='Substation West', side=1, level=3, upgrades=upgrades.airfield, crates={}, flavorText=flavor.substationwest}),
    rucarriergroup = ZoneCommander:new({zone='RU Carrier Group', side=1, level=1, upgrades=upgrades.carrier, crates={}, flavorText=flavor.rucarriergroup}),
    alpha = ZoneCommander:new({zone='Alpha', side=1, level=6, upgrades=upgrades.ships, crates={}, flavorText=flavor.alpha})
}

zones.uscarriergroup:addGroups({
	GroupCommander:new({name='carrier-sweep-1', mission='patrol', targetzone='Liwa AFB', type='carrier_air'}),
	GroupCommander:new({name='carrier-sweep-2', mission='patrol', targetzone='Liwa AFB', type='carrier_air'})
})

zones.liwaafb:addGroups({
	GroupCommander:new({name='liwaafb-supply-1', mission='supply', targetzone='Al Dhafra AFB'}), --blue
	GroupCommander:new({name='liwaafb-supply-2', mission='supply', targetzone='Al Ain Intl'}), --blue'
	GroupCommander:new({name='liwaafb-patrol-1', mission='patrol', targetzone='Liwa AFB'}) --blue air
})

zones.aldhafraafb:addGroups({
	GroupCommander:new({name='aldhafraafb-supply-1', mission='supply', targetzone='Abu Dhabi Intl'}), --blue
	GroupCommander:new({name='aldhafraafb-supply-2', mission='supply', targetzone='Al Ain Intl'}), --blue
	GroupCommander:new({name='aldhafraafb-attack-1', mission='attack', targetzone='Liwa AFB'}), --red
	GroupCommander:new({name='aldhafraafb-patrol-1', mission='patrol', targetzone='Al Dhafra AFB'}), --red air
	GroupCommander:new({name='aldhafraafb-patrol-2', mission='patrol', targetzone='Abu Dhabi Intl'}) --blue air

})

zones.alainintl:addGroups({
	GroupCommander:new({name='alainintl-supply-1', mission='supply', targetzone='Sohar'}), --blue
	GroupCommander:new({name='alainintl-supply-2', mission='supply', targetzone='Al Hayer'}), --blue
	GroupCommander:new({name='alainintl-supply-3', mission='supply', targetzone='Al Dhafra AFB'}), --red
	GroupCommander:new({name='alainintl-attack-1', mission='attack', targetzone='Al Dhafra AFB'}), --red
	GroupCommander:new({name='alainintl-patrol-1', mission='patrol', targetzone='Al Ain Intl'}) --red air
})

zones.sohar:addGroups({
	GroupCommander:new({name='sohar-supply-1', mission='supply', targetzone='Al Hayer'}) --blue
})

zones.alhayer:addGroups({
	GroupCommander:new({name='alhayer-supply-1', mission='supply', targetzone='Abu Dhabi Intl'}), --blue
	GroupCommander:new({name='alhayer-supply-2', mission='supply', targetzone='Fujairah Intl'}), --blue
	GroupCommander:new({name='alhayer-supply-3', mission='supply', targetzone='Al Minhad AFB'}) --blue
})

zones.abudhabiintl:addGroups({
	GroupCommander:new({name='abudhabiintl-supply-1', mission='supply', targetzone='Al Hayer'}), --blue
	GroupCommander:new({name='abudhabiintl-supply-2', mission='supply', targetzone='Al Minhad AFB'}), --blue
	GroupCommander:new({name='abudhabiintl-supply-3', mission='supply', targetzone='Al Dhafra AFB'}), --red
	GroupCommander:new({name='abudhabiintl-attack-1', mission='attack', targetzone='Al Dhafra AFB'}) --red
})

zones.alminhadafb:addGroups({
	GroupCommander:new({name='alminhadafb-supply-1', mission='supply', targetzone='Fujairah Intl'}), --blue
	GroupCommander:new({name='alminhadafb-supply-2', mission='supply', targetzone='Sharjah Intl'}), --blue
	GroupCommander:new({name='alminhadafb-supply-3', mission='supply', targetzone='Sir Abu Nuayr'}), --blue
	GroupCommander:new({name='alminhadafb-supply-4', mission='supply', targetzone='Abu Dhabi Intl'}), --red
	GroupCommander:new({name='alminhadafb-supply-5', mission='supply', targetzone='Fujairah Intl'}), --red
	GroupCommander:new({name='alminhadafb-supply-6', mission='supply', targetzone='Sir Abu Nuayr'}), --red
	GroupCommander:new({name='alminhadafb-supply-7', mission='supply', targetzone='Al Ain Intl'}), --red
	GroupCommander:new({name='alminhadafb-attack-1', mission='attack', targetzone='Abu Dhabi Intl'}), --red
	GroupCommander:new({name='alminhadafb-patrol-1', mission='patrol', targetzone='Al Minhad AFB'}) --red air

})

zones.fujairahintl:addGroups({
	GroupCommander:new({name='fujairahintl-supply-1', mission='supply', targetzone='Al Hutain'}), --blue
	GroupCommander:new({name='fujairahintl-supply-2', mission='supply', targetzone='Sharjah Intl'}), --blue
	GroupCommander:new({name='fujairahintl-supply-3', mission='supply', targetzone='Bandar e Jask'}), --blue
	GroupCommander:new({name='fujairahintl-supply-4', mission='supply', targetzone='Bandar e Jask'}), --red
	GroupCommander:new({name='fujairahintl-patrol-1', mission='patrol', targetzone='Fujairah Intl'}) --red air
})

zones.alhutain:addGroups({
	GroupCommander:new({name='alhutain-supply-1', mission='supply', targetzone='Sharjah Intl'}), --blue
	GroupCommander:new({name='alhutain-supply-2', mission='supply', targetzone='Ras Al Khaimah Intl'}) --blue
})

zones.sharjahintl:addGroups({
	GroupCommander:new({name='sharjahintl-supply-1', mission='supply', targetzone='Al Hutain'}), --blue
	GroupCommander:new({name='sharjahintl-supply-2', mission='supply', targetzone='Ras Al Khaimah Intl'}), --blue
	GroupCommander:new({name='sharjahintl-supply-3', mission='supply', targetzone='Abu Musa Island'}), --blue
	GroupCommander:new({name='sharjahintl-supply-4', mission='supply', targetzone='Al Minhad AFB'}), --red
	GroupCommander:new({name='sharjahintl-attack-1', mission='attack', targetzone='Al Minhad AFB'}), --red
	GroupCommander:new({name='sharjahintl-patrol-1', mission='patrol', targetzone='Al Minhad AFB'}) --red air
})

zones.sirabunuayr:addGroups({
	GroupCommander:new({name='sirabunuayr-supply-1', mission='supply', targetzone='Abu Musa Island'}) --blue
})

zones.abumusaisland:addGroups({
	GroupCommander:new({name='abumusaisland-supply-1', mission='supply', targetzone='Tunb Island AFB'}) --blue
})

zones.rasalkhaimahintl:addGroups({
	GroupCommander:new({name='rasalkhaimahintl-supply-1', mission='supply', targetzone='Khasab'}), --blue
	GroupCommander:new({name='rasalkhaimahintl-supply-2', mission='supply', targetzone='Bandar e Jask'}), --blue
	GroupCommander:new({name='rasalkhaimahintl-supply-3', mission='supply', targetzone='Sharjah Intl'}), --red
	GroupCommander:new({name='rasalkhaimahintl-attack-1', mission='attack', targetzone='Sharjah Intl'}), --red
	GroupCommander:new({name='rasalkhaimahintl-attack-2', mission='attack', targetzone='Fujairah Intl'}), --red
	GroupCommander:new({name='rasalkhaimahintl-patrol-1', mission='patrol', targetzone='Sharjah Intl'}) --red air
})

zones.bandarejask:addGroups({
	GroupCommander:new({name='bandarejask-patrol-1', mission='patrol', targetzone='Bandar e Jask'}) --red air
})

zones.khasab:addGroups({
	GroupCommander:new({name='khasab-supply-1', mission='supply', targetzone='Qeshm Island'}), --blue
	GroupCommander:new({name='khasab-supply-2', mission='supply', targetzone='Tunb Island AFB'}), --blue
	GroupCommander:new({name='khasab-supply-3', mission='supply', targetzone='Ras Al Khaimah Intl'}), --red
	GroupCommander:new({name='khasab-attack-1', mission='attack', targetzone='Ras Al Khaimah Intl'}), --red
	GroupCommander:new({name='khasab-patrol-1', mission='patrol', targetzone='Khasab'}) --red air
})

zones.tunbislandafb:addGroups({
	GroupCommander:new({name='tunbislandafb-supply-1', mission='supply', targetzone='Qeshm Island'}), --blue
	GroupCommander:new({name='tunbislandafb-supply-2', mission='supply', targetzone='Bandar Lengeh'}), --blue
	GroupCommander:new({name='tunbislandafb-supply-3', mission='supply', targetzone='Abu Musa Island'}), --red
	GroupCommander:new({name='tunbislandafb-attack-1', mission='attack', targetzone='Abu Musa Island'}), --red
	GroupCommander:new({name='tunbislandafb-attack-2', mission='attack', targetzone='Khasab'}), --red
	GroupCommander:new({name='tunbislandafb-patrol-1', mission='patrol', targetzone='Tunb Island AFB'}) --red air
})

zones.bandarlengeh:addGroups({
	GroupCommander:new({name='bandarlengeh-supply-1', mission='supply', targetzone='Lar'}), --blue
	GroupCommander:new({name='bandarlengeh-supply-2', mission='supply', targetzone='Qeshm Island'}), --blue
	GroupCommander:new({name='bandarlengeh-supply-3', mission='supply', targetzone='Qeshm Island'}), --red
	GroupCommander:new({name='bandarlengeh-supply-4', mission='supply', targetzone='Tunb Island AFB'}), --red
	GroupCommander:new({name='bandarlengeh-attack-1', mission='attack', targetzone='Tunb Island AFB'}), --red
	GroupCommander:new({name='bandarlengeh-patrol-1', mission='patrol', targetzone='Bandar Lengeh'}) --red air
})

zones.qeshmisland:addGroups({
	GroupCommander:new({name='qeshmisland-supply-1', mission='supply', targetzone='Bandar Abbas Intl'}), --blue
	GroupCommander:new({name='qeshmisland-supply-2', mission='supply', targetzone='Substation East'}), --blue
	GroupCommander:new({name='qeshmisland-supply-3', mission='supply', targetzone='Khasab'}), --red
	GroupCommander:new({name='qeshmisland-attack-1', mission='attack', targetzone='Khasab'}) --red

})

zones.bandarabbasintl:addGroups({
	GroupCommander:new({name='bandarabbasintl-supply-1', mission='supply', targetzone='Lar'}), --blue
	GroupCommander:new({name='bandarabbasintl-supply-2', mission='supply', targetzone='Jiroft'}), --blue
	GroupCommander:new({name='bandarabbasintl-supply-3', mission='supply', targetzone='Substation East'}), --blue
	GroupCommander:new({name='bandarabbasintl-supply-4', mission='supply', targetzone='Substation East'}), --red
	GroupCommander:new({name='bandarabbasintl-supply-5', mission='supply', targetzone='Qeshm Island'}), --red
	GroupCommander:new({name='bandarabbasintl-attack-1', mission='attack', targetzone='Qeshm Island'}), --red
	GroupCommander:new({name='bandarabbasintl-patrol-1', mission='patrol', targetzone='Bandar Abbas Intl'}) --red air
})

zones.lar:addGroups({
	GroupCommander:new({name='lar-supply-1', mission='supply', targetzone='Substation West'}), --blue
	GroupCommander:new({name='lar-supply-2', mission='supply', targetzone='Shiraz Intl Outskirts'}), --blue
	GroupCommander:new({name='lar-supply-3', mission='supply', targetzone='Bandar Lengeh'}), --red
	GroupCommander:new({name='lar-supply-4', mission='supply', targetzone='Substation West'}), --red
	GroupCommander:new({name='lar-supply-5', mission='supply', targetzone='Bandar Abbas Intl'}), --red
	GroupCommander:new({name='lar-patrol-1', mission='patrol', targetzone='Lar'}) --red air
})

zones.shirazintloutskirts:addGroups({
	GroupCommander:new({name='shirazintloutskirts-supply-1', mission='supply', targetzone='Shiraz Intl'}), --blue
	GroupCommander:new({name='shirazintloutskirts-supply-2', mission='supply', targetzone='Jiroft'}), --blue
	GroupCommander:new({name='shirazintloutskirts-supply-3', mission='supply', targetzone='Kerman Outskirts'}) --blue
})

zones.jiroft:addGroups({
	GroupCommander:new({name='jiroft-supply-1', mission='supply', targetzone='Kerman Outskirts'}), --blue
	GroupCommander:new({name='jiroft-supply-2', mission='supply', targetzone='Substation East'}), --blue
	GroupCommander:new({name='jiroft-supply-3', mission='supply', targetzone='Bandar Abbas Intl'}) --red
})

zones.kermanoutskirts:addGroups({
	GroupCommander:new({name='kermanoutskirts-supply-1', mission='supply', targetzone='Kerman'}), --blue
	GroupCommander:new({name='kermanoutskirts-supply-2', mission='supply', targetzone='Shiraz Intl'}) --blue
})

zones.shirazintl:addGroups({
	GroupCommander:new({name='shirazintl-supply-1', mission='supply', targetzone='Shiraz Intl Outskirts'}), --red
	GroupCommander:new({name='shirazintl-supply-2', mission='supply', targetzone='Kerman'}), --red
	GroupCommander:new({name='shirazintl-patrol-1', mission='patrol', targetzone='Shiraz Intl'}), --red air
	GroupCommander:new({name='shirazintl-patrol-2', mission='patrol', targetzone='Shiraz Intl'}) --red air
})

zones.kerman:addGroups({
	GroupCommander:new({name='kerman-supply-1', mission='supply', targetzone='Kerman Outskirts'}), --red
	GroupCommander:new({name='kerman-supply-2', mission='supply', targetzone='Shiraz Intl'}), --red
	GroupCommander:new({name='kerman-patrol-1', mission='patrol', targetzone='Kerman'}), --red air
	GroupCommander:new({name='kerman-patrol-2', mission='patrol', targetzone='Kerman'}) --red air
})

zones.substationeast:addGroups({

})

zones.substationwest:addGroups({

})

zones.rucarriergroup:addGroups({
	GroupCommander:new({name='rucarrier-sweep-1', mission='patrol', targetzone='RU Carrier Group'}),
	GroupCommander:new({name='rucarrier-sweep-2', mission='patrol', targetzone='RU Carrier Group'})
})

--End of Group

zones.bandarejask:addCriticalObject('PowerPlant1')
zones.bandarejask:addCriticalObject('PowerPlant2')

zones.substationeast:addCriticalObject('substation3')
zones.substationeast:addCriticalObject('substation4')

zones.substationwest:addCriticalObject('substation1')
zones.substationwest:addCriticalObject('substation2')

zones.alhayer:addCriticalObject('factory1')
zones.alhayer:addCriticalObject('factory2')
zones.alhayer:addCriticalObject('factory3')
zones.alhayer:addCriticalObject('factory4')

zones.sirabunuayr:addCriticalObject('tv1')

-- zones.khasab:addCriticalObject('radioTower1')

zones.bandarejask:addCriticalObject('ccEast')
zones.liwaafb:addCriticalObject('ccWest')

for i,v in pairs(zones) do
	bc:addZone(v)
end

--connection

bc:addConnection("Liwa AFB","Al Dhafra AFB")
bc:addConnection("Al Dhafra AFB","Abu Dhabi Intl")
bc:addConnection("Al Dhafra AFB","Al Ain Intl")
bc:addConnection("Al Ain Intl","Al Hayer")
bc:addConnection("Al Ain Intl","Abu Dhabi Intl")
bc:addConnection("Al Ain Intl","Sohar")
bc:addConnection("Sohar","Al Hayer")
bc:addConnection("Al Hayer","Abu Dhabi Intl")
bc:addConnection("Al Hayer","Al Minhad AFB")
bc:addConnection("Al Hayer","Fujairah Intl")
bc:addConnection("Abu Dhabi Intl","Al Minhad AFB")
bc:addConnection("Al Minhad AFB","Fujairah Intl")
bc:addConnection("Al Minhad AFB","Sharjah Intl")
bc:addConnection("Sharjah Intl","Sir Abu Nuayr")
bc:addConnection("Sharjah Intl","Fujairah Intl")
bc:addConnection("Sharjah Intl","Abu Musa Island")
bc:addConnection("Sharjah Intl","Ras Al Khaimah Intl")
bc:addConnection("Sharjah Intl","Al Hutain")
bc:addConnection("Fujairah Intl","Al Hutain")
bc:addConnection("Fujairah Intl","Bandar e Jask")
bc:addConnection("Al Hutain","Ras Al Khaimah Intl")
bc:addConnection("Ras Al Khaimah Intl","Abu Musa Island")
bc:addConnection("Ras Al Khaimah Intl","Tunb Island AFB")
bc:addConnection("Ras Al Khaimah Intl","Khasab")
bc:addConnection("Sir Abu Nuayr","Abu Musa Island")
bc:addConnection("Abu Musa Island","Tunb Island AFB")
bc:addConnection("Khasab","Tunb Island AFB")
bc:addConnection("Khasab","Qeshm Island")
bc:addConnection("Khasab","Bandar e Jask")
bc:addConnection("Tunb Island AFB","Bandar Lengeh")
bc:addConnection("Tunb Island AFB","Qeshm Island")
bc:addConnection("Bandar Lengeh","Qeshm Island")
bc:addConnection("Bandar Lengeh","Lar")
bc:addConnection("Bandar Lengeh","Bandar Abbas Intl")
bc:addConnection("Qeshm Island","Lar")
bc:addConnection("Qeshm Island","Bandar Abbas Intl")
bc:addConnection("Qeshm Island","Substation East")
bc:addConnection("Lar","Substation West")
bc:addConnection("Lar","Shiraz Intl Outskirts")
bc:addConnection("Lar","Bandar Abbas Intl")
bc:addConnection("Lar","Jiroft")
bc:addConnection("Bandar Abbas Intl","Jiroft")
bc:addConnection("Bandar Abbas Intl","Substation East")
bc:addConnection("Jiroft","Shiraz Intl Outskirts")
bc:addConnection("Jiroft","Kerman Outskirts")
bc:addConnection("Jiroft","Substation East")
bc:addConnection("Shiraz Intl Outskirts","Substation West")
bc:addConnection("Shiraz Intl Outskirts","Shiraz Intl")
bc:addConnection("Shiraz Intl Outskirts","Kerman Outskirts")
bc:addConnection("Shiraz Intl","Kerman Outskirts")
bc:addConnection("Kerman Outskirts","Kerman")

local checkMissionComplete = function (event, sender)
    local done = true
    for i,v in ipairs(bc:getZones()) do
        if v.side == 1 then
            done = false
            break
        end
    end

    if done then
        trigger.action.outText("Enemy has been defeated. \n\nMission Complete.", 120)
        trigger.action.setUserFlag("100", true)

        local function main()
            timer.scheduleFunction(main, {}, timer.getTime() + 1)

            if trigger.misc.getUserFlag('100') == 1 then
               os.remove("C:\Users\Administrator\Saved Games\DCS.openbeta_server/Foothold Large PGulf V.5.lua")
			   os.remove("D:\DCS World OpenBeta Server\Foothold Large PGulf V.5.csv")
               trigger.action.setUserFlag("6000", true)
            end
            end
            main()
    end
end

for i,v in ipairs(bc:getZones()) do
	v:registerTrigger('lost', checkMissionComplete, 'missioncompleted')
end

--zone triggers

zones.substationeast:registerTrigger('lost', function(event, sender)
	sender:disableZone()
end, 'disablesubn1')

zones.substationeast:registerTrigger('destroyed', function(event, sender)
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Substation disabled\n+500 credits',20)
end, 'disablesubn2')

zones.sirabunuayr:registerTrigger('lost', function(event, sender)
	sender:disableZone()
end, 'disabletv1')

zones.sirabunuayr:registerTrigger('destroyed', function(event, sender)
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'TV Tower disabled\n+500 credits',20)
end, 'disabletv2')

zones.substationwest:registerTrigger('lost', function(event, sender)
	sender:disableZone()
end, 'disablesubw1')

zones.substationwest:registerTrigger('destroyed', function(event, sender)
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Substation disabled\n+500 credits',20)
end, 'disablesubw2')

zones.khasab:registerTrigger('lost', function(event, sender)
	sender:disableZone()
end, 'disableradio1')

zones.khasab:registerTrigger('destroyed', function(event, sender)
	bc:addFunds(2,500)
	trigger.action.outTextForCoalition(2,'Radio Tower disabled\n+500 credits',20)
end, 'disableradio2')


--end of zone triggers

bc:addMonitoredROE('cruise1')
local cruiseMissileTargetMenu = nil
bc:registerShopItem('cruisemsl', 'Cruise Missile Strike', 500, function(sender)
	if cruiseMissileTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if cruiseMissileTargetMenu then
			local err = bc:fireAtZone(target, 'cruise1', true, 8)
			if err then
				return err
			end

			cruiseMissileTargetMenu = nil
			trigger.action.outTextForCoalition(2, 'Launching cruise missiles at '..target, 15)
		end
	end

	cruiseMissileTargetMenu = bc:showTargetZoneMenu(2, 'Cruise Missile Target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'Cruise missiles ready. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local err = bc:fireAtZone(params.zone.zone, 'cruise1', true, 8)
		if err then
			return err
		end

		trigger.action.outTextForCoalition(2, 'Launching cruise missiles at '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

local upgradeMenu = nil
bc:registerShopItem('supplies', 'Resupply friendly Zone', 200, function(sender)
	if upgradeMenu then
		return 'Choose zone from F10 menu'
	end

	local upgradeZone = function(target)
		if upgradeMenu then
			local zn = bc:getZoneByName(target)
			if zn and zn.side==2 then
				zn:upgrade()
			else
				return 'Zone not friendly'
			end

			upgradeMenu = nil
		end
	end

	upgradeMenu = bc:showTargetZoneMenu(2, 'Select Zone to resupply', upgradeZone, 2)

	trigger.action.outTextForCoalition(2, 'Supplies prepared. Choose zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then
		params.zone:upgrade()
	else
		return 'Can only target friendly zone'
	end
end)

local spawnCapEast = function(sender)
	local gr = Group.getByName('cap-east')
	if Utils.isGroupActive(gr) then
		return 'CAP mission still in progress'
	end
	mist.respawnGroup('cap-east', true)
	trigger.action.outTextForCoalition(2,'CAP Group From East Active',15)
end
Group.getByName('cap-east'):destroy()
bc:registerShopItem('capeast', 'CAP East (F-14B)', 100, spawnCapEast, spawnCapEast)

local spawnAwacs2 = function(sender)
	local gr = Group.getByName('awacs-south')
	if Utils.isGroupActive(gr) then
		return 'Overlord still active on 253.00 MHz AM'
	end
	mist.respawnGroup('awacs-south', true)
	trigger.action.outTextForCoalition(2,'Overlord active on 253.00 MHz AM',15)
end
Group.getByName('awacs-south'):destroy()
bc:registerShopItem('awacssouth', 'AWACS South (E-3A)', 100, spawnAwacs2, spawnAwacs2)

local spawnfuelerSouth = function(sender)
	local gr = Group.getByName('fueler-south')
	if Utils.isGroupActive(gr) then
		return 'Texaco still active on 254.00 MHz AM'
	end
	mist.respawnGroup('fueler-south', true)
	trigger.action.outTextForCoalition(2,'Texaco active on 254.00 MHz AM',15)
end
Group.getByName('fueler-south'):destroy()
bc:registerShopItem('fuelersouth', 'Fueler South (KC-135MPRSA)', 100, spawnfuelerSouth, spawnfuelerSouth)

Group.getByName('cas-south'):destroy()
local casTargetMenu = nil
bc:registerShopItem('caseast', 'CAS South (A-10C)', 400, function(sender)
	local gr = Group.getByName('cas-south')
	if Utils.isGroupActive(gr) then
		return 'Ground attack mission still in progress'
	end

	mist.respawnGroup('cas-south', true)

	if casTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if casTargetMenu then
			if Group.getByName('cas-south') then
				local err = bc:engageZone(target, 'cas-south')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'A-10C engaging groups at '..target, 15)
			else
				trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
			end

			casTargetMenu = nil
		end
	end

	casTargetMenu = bc:showTargetZoneMenu(2, 'CAS South Target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'A-10C on route. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('cas1')
		if Utils.isGroupActive(gr) then
			return 'Ground attack mission still in progress'
		end

		mist.respawnGroup('cas-south', true)
		mist.scheduleFunction(function(target)
			if Group.getByName('cas-south') then
				local err = bc:engageZone(target, 'cas-south')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'A-10C engaging groups at '..target, 15)
			end
		end,{params.zone.zone},timer.getTime()+2)
	else
		return 'Can only target enemy zone'
	end
end)

Group.getByName('bomber-south'):destroy()
local bomberTargetMenu = nil
bc:registerShopItem('bombseast', 'Bombing run South (F-15E)', 600, function(sender)
	local gr = Group.getByName('bomber-south')
	if Utils.isGroupActive(gr) then
		return 'Bombing run still in progress'
	end

	mist.respawnGroup('bomber-south', true)

	if bomberTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if bomberTargetMenu then
			local bomb = Group.getByName('bomber-south')
			if bomb then
				local err = bc:engageZone(target, 'bomber-south')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'F-15E engaging groups at '..target, 15)
			else
				trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
			end

			bomberTargetMenu = nil
		end
	end

	bomberTargetMenu = bc:showTargetZoneMenu(2, 'Bombing run South Target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'F-15E on route. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('bomber-south')
		if Utils.isGroupActive(gr) then
			return 'Bombing run still in progress'
		end

		mist.respawnGroup('bomber-south', true)

		mist.scheduleFunction(function(target)
			local bomb = Group.getByName('bomber-south')
			if bomb then
				local err = bc:engageZone(target, 'bomber-south')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'F-15E engaging groups at '..target, 15)
			end
		end,{params.zone.zone},timer.getTime()+2)
	else
		return 'Can only target enemy zone'
	end
end)

Group.getByName('sead-south'):destroy()
local seadTargetMenu = nil
bc:registerShopItem('seadeast', 'SEAD South (F-16C)', 150, function(sender)
	local gr = Group.getByName('sead-south')
	if Utils.isGroupActive(gr) then
		return 'SEAD mission still in progress'
	end
	mist.respawnGroup('sead-south', true)

	if seadTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if Group.getByName('sead-south') then
			local err = bc:engageZone(target, 'sead-south', AI.Task.WeaponExpend.ALL)
			if err then
				return err
			end

			trigger.action.outTextForCoalition(2, 'F-16 Vipers engaging SAMs at '..target, 15)
		else
			trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
		end

		seadTargetMenu = nil
	end

	seadTargetMenu = bc:showTargetZoneMenu(2, 'SEAD South Target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'F-16 Vipers on route. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('sead-south')
		if Utils.isGroupActive(gr) then
			return 'SEAD mission still in progress'
		end

		mist.respawnGroup('sead-south', true)
		mist.scheduleFunction(function(target)
			if Group.getByName('sead-south') then
				local err = bc:engageZone(target, 'sead-south')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'F-16 Vipers engaging SAMs at '..target, 15)
			end
		end,{params.zone.zone},timer.getTime()+2)
	else
		return 'Can only target enemy zone'
	end
end)

local spawnCapSouth = function(sender)
	local gr = Group.getByName('cap-south')
	if Utils.isGroupActive(gr) then
		return 'CAP mission still in progress'
	end
	mist.respawnGroup('cap-south', true)
	trigger.action.outTextForCoalition(2,'CAP Group From South Active',15)
end
Group.getByName('cap-south'):destroy()
bc:registerShopItem('capsouth', 'CAP South (F-15C)', 100, spawnCapSouth, spawnCapSouth)

local spawnAwacsEast = function(sender)
	local gr = Group.getByName('awacs-east')
	if Utils.isGroupActive(gr) then
		return 'Wizard still active on 262.00 MHz AM'
	end
	mist.respawnGroup('awacs-east', true)
	trigger.action.outTextForCoalition(2,'Wizard active on 262.00 MHz AM',15)
end
Group.getByName('awacs-east'):destroy()
bc:registerShopItem('east', 'AWACS East (E-3A)', 100, spawnAwacsEast, spawnAwacsEast)

local spawnfuelereast = function(sender)
	local gr = Group.getByName('fueler-east')
	if Utils.isGroupActive(gr) then
		return 'Shell still active on 264.00 MHz AM'
	end
	mist.respawnGroup('fueler-east', true)
	trigger.action.outTextForCoalition(2,'Shell active on 26.00 MHz AM',15)
end
Group.getByName('fueler-east'):destroy()
bc:registerShopItem('fuelereast', 'Fueler East (S3B Tanker)', 100, spawnfuelereast, spawnfuelereast)

Group.getByName('sead-east'):destroy()
local seadTargetMenu = nil
bc:registerShopItem('seadsouth', 'SEAD East (F/A-18C)', 150, function(sender)
	local gr = Group.getByName('sead-east')
	if Utils.isGroupActive(gr) then
		return 'SEAD mission still in progress'
	end
	mist.respawnGroup('sead-east', true)

	if seadTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if Group.getByName('sead-east') then
			local err = bc:engageZone(target, 'sead-east', AI.Task.WeaponExpend.ALL)
			if err then
				return err
			end

			trigger.action.outTextForCoalition(2, 'F/A-18C Hornets engaging SAMs at '..target, 15)
		else
			trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
		end

		seadTargetMenu = nil
	end

	seadTargetMenu = bc:showTargetZoneMenu(2, 'SEAD EAST Target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'F/A-18C Hornets on route. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('sead-east')
		if Utils.isGroupActive(gr) then
			return 'SEAD mission still in progress'
		end

		mist.respawnGroup('sead-east', true)
		mist.scheduleFunction(function(target)
			if Group.getByName('sead-east') then
				local err = bc:engageZone(target, 'sead-east')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'F/A-18C Hornets engaging SAMs at '..target, 15)
			end
		end,{params.zone.zone},timer.getTime()+2)
	else
		return 'Can only target enemy zone'
	end
end)

Group.getByName('cas-east'):destroy()
local casTargetMenu = nil
bc:registerShopItem('cassouth', 'CAS East (F/A-18C)', 400, function(sender)
	local gr = Group.getByName('cas-east')
	if Utils.isGroupActive(gr) then
		return 'Ground attack mission still in progress'
	end

	mist.respawnGroup('cas-east', true)

	if casTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if casTargetMenu then
			if Group.getByName('cas-east') then
				local err = bc:engageZone(target, 'cas-east')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'F-16C engaging groups at '..target, 15)
			else
				trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
			end

			casTargetMenu = nil
		end
	end

	casTargetMenu = bc:showTargetZoneMenu(2, 'CAS South Target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'F-16C on route. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('cas-east')
		if Utils.isGroupActive(gr) then
			return 'Ground attack mission still in progress'
		end

		mist.respawnGroup('cas-east', true)
		mist.scheduleFunction(function(target)
			if Group.getByName('cas-east') then
				local err = bc:engageZone(target, 'cas-east')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'F-16C engaging groups at '..target, 15)
			end
		end,{params.zone.zone},timer.getTime()+2)
	else
		return 'Can only target enemy zone'
	end
end)

Group.getByName('bomber-east'):destroy()
local bomberTargetMenu = nil
bc:registerShopItem('bombssouth', 'Bombing run East (B-1B)', 600, function(sender)
	local gr = Group.getByName('bomber-east')
	if Utils.isGroupActive(gr) then
		return 'Bombing run still in progress'
	end

	mist.respawnGroup('bomber-east', true)

	if bomberTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if bomberTargetMenu then
			local bomb = Group.getByName('bomber-east')
			if bomb then
				local err = bc:engageZone(target, 'bomber-east')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'B-1B engaging groups at '..target, 15)
			else
				trigger.action.outTextForCoalition(2, 'Group has left the area or has been destroyed', 15)
			end

			bomberTargetMenu = nil
		end
	end

	bomberTargetMenu = bc:showTargetZoneMenu(2, 'Bombing run South Target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'B-1B on route. Choose target zone from F10 menu', 15)
end,
function (sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('bomber-east')
		if Utils.isGroupActive(gr) then
			return 'Bombing run still in progress'
		end

		mist.respawnGroup('bomber-east', true)

		mist.scheduleFunction(function(target)
			local bomb = Group.getByName('bomber-east')
			if bomb then
				local err = bc:engageZone(target, 'bomber-east')
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'B-1B engaging groups at '..target, 15)
			end
		end,{params.zone.zone},timer.getTime()+2)
	else
		return 'Can only target enemy zone'
	end
end)

Group.getByName('jtacDrone'):destroy()
local jtacTargetMenu = nil
drone = JTAC:new({name = 'jtacDrone'})
bc:registerShopItem('jtac', 'MQ-9 Reaper JTAC mission', 100, function(sender)

	if jtacTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local spawnAndOrbit = function(target)
		if jtacTargetMenu then
			local zn = bc:getZoneByName(target)
			drone:deployAtZone(zn)
			drone:showMenu()
			trigger.action.outTextForCoalition(2, 'Reaper drone deployed over '..target, 15)
			jtacTargetMenu = nil
		end
	end

	jtacTargetMenu = bc:showTargetZoneMenu(2, 'Deploy JTAC', spawnAndOrbit, 1)

	trigger.action.outTextForCoalition(2, 'Choose which zone to deploy JTAC at from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		drone:deployAtZone(params.zone)
		drone:showMenu()
		trigger.action.outTextForCoalition(2, 'Reaper drone deployed over '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

local smoketargets = function(tz)
	local units = {}
	for i,v in pairs(tz.built) do
		local g = Group.getByName(v)
		for i2,v2 in ipairs(g:getUnits()) do
			table.insert(units, v2)
		end
	end

	local tgts = {}
	for i=1,3,1 do
		if #units > 0 then
			local selected = math.random(1,#units)
			table.insert(tgts, units[selected])
			table.remove(units, selected)
		end
	end

	for i,v in ipairs(tgts) do
		local pos = v:getPosition().p
		trigger.action.smoke(pos, 1)
	end
end

local smokeTargetMenu = nil
bc:registerShopItem('smoke', 'Smoke markers', 20, function(sender)
	if smokeTargetMenu then
		return 'Choose target zone from F10 menu'
	end

	local launchAttack = function(target)
		if smokeTargetMenu then
			local tz = bc:getZoneByName(target)
			smoketargets(tz)
			smokeTargetMenu = nil
			trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..target, 15)
		end
	end

	smokeTargetMenu = bc:showTargetZoneMenu(2, 'Smoke marker target', launchAttack, 1)

	trigger.action.outTextForCoalition(2, 'Choose target zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		smoketargets(params.zone)
		trigger.action.outTextForCoalition(2, 'Targets marked with RED smoke at '..params.zone.zone, 15)
	else
		return 'Can only target enemy zone'
	end
end)

Group.getByName('ewAircraft'):destroy()
local jamMenu = nil
bc:registerShopItem('jam', 'Jam radars at zone', 500, function(sender)
	local gr = Group.getByName('ewAircraft')
	if Utils.isGroupActive(gr) then
		return 'Jamming mission still in progress'
	end

	mist.respawnGroup('ewAircraft', true)

	if jamMenu then
		return 'Choose target zone from F10 menu'
	end

	local startJam = function(target)
		if jamMenu then
			bc:jamRadarsAtZone('ewAircraft', target)
			jamMenu = nil
			trigger.action.outTextForCoalition(2, 'Growler jamming radars at '..target, 15)
		end
	end

	jamMenu = bc:showTargetZoneMenu(2, 'Jamming target', startJam, 1)
	trigger.action.outTextForCoalition(2, 'Choose target zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 1 then
		local gr = Group.getByName('ewAircraft')
		if Utils.isGroupActive(gr) then
			return 'Jamming mission still in progress'
		end

		mist.respawnGroup('ewAircraft', true)

		mist.scheduleFunction(function(target)
			local ew = Group.getByName('ewAircraft')
			if ew then
				local err = bc:jamRadarsAtZone('ewAircraft', target)
				if err then
					return err
				end

				trigger.action.outTextForCoalition(2, 'Growler jamming radars at '..target, 15)
			end
		end,{params.zone.zone},timer.getTime()+2)

	else
		return 'Can only target enemy zone'
	end
end)

tanksMenu = nil
bc:registerShopItem('armor', 'Deploy armor (for combined arms)', 100, function(sender)

	if tanksMenu then
		return 'Choose deploy zone from F10 menu'
	end

	local deployTanks = function(target)
		if tanksMenu then

			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-tanks')

			tanksMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..target, 15)
		end
	end

	tanksMenu = bc:showTargetZoneMenu(2, 'Deploy armor (Choose friendly zone)', deployTanks, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then

		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-tanks')
		trigger.action.outTextForCoalition(2, 'Friendly armor deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

artyMenu = nil
bc:registerShopItem('artillery', 'Deploy artillery (for combined arms)', 100, function(sender)

	if artyMenu then
		return 'Choose deploy zone from F10 menu'
	end

	local deployArty = function(target)
		if artyMenu then

			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-arty')

			artyMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..target, 15)
		end
	end

	artyMenu = bc:showTargetZoneMenu(2, 'Deploy artillery (Choose friendly zone)', deployArty, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then

		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-arty')
		trigger.action.outTextForCoalition(2, 'Friendly artillery deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

reconMenu = nil
bc:registerShopItem('recon', 'Deploy recon group (for combined arms)', 50, function(sender)

	if reconMenu then
		return 'Choose deploy zone from F10 menu'
	end

	local deployRecon = function(target)
		if reconMenu then

			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-recon')

			reconMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..target, 15)
		end
	end

	reconMenu = bc:showTargetZoneMenu(2, 'Deploy recon group (Choose friendly zone)', deployRecon, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then

		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-recon')
		trigger.action.outTextForCoalition(2, 'Friendly recon group deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

airdefMenu = nil
bc:registerShopItem('airdef', 'Deploy air defence (for combined arms)', 150, function(sender)

	if airdefMenu then
		return 'Choose deploy zone from F10 menu'
	end

	local deployAirDef = function(target)
		if airdefMenu then

			local zn = CustomZone:getByName(target)
			zn:spawnGroup('ca-airdef')

			airdefMenu = nil
			trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..target, 15)
		end
	end

	airdefMenu = bc:showTargetZoneMenu(2, 'Deploy air defence (Choose friendly zone)', deployAirDef, 2)
	trigger.action.outTextForCoalition(2, 'Choose deploy zone from F10 menu', 15)
end,
function(sender, params)
	if params.zone and params.zone.side == 2 then

		local zn = CustomZone:getByName(params.zone.zone)
		zn:spawnGroup('ca-airdef')
		trigger.action.outTextForCoalition(2, 'Friendly air defence deployed at '..params.zone.zone, 15)
	else
		return 'Can only deploy at friendly zone'
	end
end)

bc:addShopItem(2, 'cruisemsl', 12)
bc:addShopItem(2, 'supplies', -1)
bc:addShopItem(2, 'jtac', -1)
bc:addShopItem(2, 'smoke', -1)
bc:addShopItem(2, 'jam', -1)

bc:addShopItem(2, 'caseast', -1)
bc:addShopItem(2, 'bombseast', -1)
bc:addShopItem(2, 'capeast', -1)
bc:addShopItem(2, 'awacseast', -1)
bc:addShopItem(2, 'seadeast', -1)
bc:addShopItem(2, 'fuelereast', -1)

bc:addShopItem(2, 'cassouth', -1)
bc:addShopItem(2, 'bombssouth', -1)
bc:addShopItem(2, 'capsouth', -1)
bc:addShopItem(2, 'awacssouth', -1)
bc:addShopItem(2, 'seadsouth', -1)
bc:addShopItem(2, 'fuelersouth', -1)

bc:addShopItem(2, 'armor', -1)
bc:addShopItem(2, 'artillery', -1)
bc:addShopItem(2, 'recon', -1)
bc:addShopItem(2, 'airdef', -1)

supplyZones = {
	'Liwa AFB',
	'Al Dhafra AFB',
	'Al Minhad AFB',
	'Fujairah Intl',
	'Ras Al Khaimah Intl',
	'Khasab',
	'Abu Musa Island',
	'Tunb Island AFB',
	'Bandar Lengeh',
	'Qeshm Island',
	'Bandar Abbas Intl',
	'Lar',
	'Shiraz Intl',
	'Kerman',
	'US Carrier Group',
	'RU Carrier Group'
}
lc = LogisticCommander:new({battleCommander = bc, supplyZones = supplyZones})
lc:init()

bc:loadFromDisk() --will load and overwrite default zone levels, sides, funds and available shop items
bc:init()
bc:startRewardPlayerContribution(15,{infantry = 10, ground = 20, sam = 40, airplane = 50, ship = 250, helicopter=50, crate=200, rescue = 100})
HercCargoDropSupply.init(bc)

GlobalSettings.defaultRespawns[1]['supply'] = { dead=60*60, hangar=40*60}
GlobalSettings.setDifficultyScaling(1.4,1)

evc = EventCommander:new({ decissionFrequency=30*60, decissionVariance=30*60, skipChance = 10})
evc:init()


Group.getByName('evt-cas'):destroy()
evc:addEvent({
	id='cas',
	action = function()
		mist.respawnGroup('evt-cas', true)

		timer.scheduleFunction(function(param, time)
			local tgts = {
				'Liwa AFB',
				'Al Ain Intl',
				'Abu Dhabi Intl',
				'Maykop',
				'Al Minhad AFB',
				'Fuijairah Intl',
				'Dubai Intl',
				'Sir Abu Nuayr',
				'Ras Al Khaimah Intl',
				'Qeshm Island',
				'Bandar Lengeh',
				'Bandar Abbas Intl',
				'Lar',
				'Jiroft',
				'Shiraz Intl',
				'Kerman'
			}

			local validtgts = {}
			for _,v in ipairs(tgts) do
				if bc:getZoneByName(v).side == 2 then
					table.insert(validtgts, v)
				end
			end

			if #validtgts ~= 0 then
				local die = math.random(1,#validtgts)
				local choice = validtgts[die]

				if Group.getByName('evt-cas') then
					bc:engageZone(choice, 'evt-cas')
				end
			end
		end, {}, timer.getTime()+3)
	end,
	canExecute = function()
		local gr = Group.getByName('evt-cas')
		if gr then return false end

		if bc:getZoneByName('Al Minhad AFB').side ~= 1 then return false end

		local triggers = { 'Khasab', 'Bandar e Jask'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end

		return false
	end
})

Group.getByName('evt-bomber'):destroy()
evc:addEvent({
	id='bomb',
	action = function()
		mist.respawnGroup('evt-bomber', true)
	end,
	canExecute = function()
		local gr = Group.getByName('evt-bomber')
		if gr then return false end

		local triggers = { 'Jiroft', 'Qeshm Island'}
		for _,v in ipairs(triggers) do
			if bc:getZoneByName(v).side == 2 then
				return true
			end
		end

		return false
	end
})

function startBomberAttack() -- called from bomber groups waypoint actions
	local tgts = {
		'Liwa AFB',
		'Al Ain Intl',
		'Abu Dhabi Intl',
		'Maykop',
		'Al Minhad AFB',
		'Fuijairah Intl',
		'Dubai Intl',
		'Sir Abu Nuayr',
		'Ras Al Khaimah Intl',
		'Qeshm Island',
		'Bandar Lengeh',
		'Bandar Abbas Intl',
		'Lar',
		'Jiroft',
		'Shiraz Intl',
		'Kerman'
	}

	local validtgts = {}
	for _,v in ipairs(tgts) do
		if bc:getZoneByName(v).side == 2 then
			table.insert(validtgts, v)
		end
	end

	if #validtgts ~= 0 then
		local die = math.random(1,#validtgts)
		local choice = validtgts[die]

		if Group.getByName('evt-bomber') then
			bc:engageZone(choice, 'evt-bomber',  AI.Task.WeaponExpend.HALF)
		end
	end
end

Group.getByName('evt-shiptercept1'):destroy()
Group.getByName('evt-shiptercept2'):destroy()
Group.getByName('evt-shiptercept3'):destroy()
local shipDieEvent = nil
evc:addEvent({
	id='shiptercept',
	action = function()

		local ships = {'evt-shiptercept1','evt-shiptercept2','evt-shiptercept3'}
		local choice = math.random(1,#ships)

		mist.respawnGroup(ships[choice], true)

		local shipDied = function(event)
			if event.id==30 then
				if event.initiator and event.initiator.getName then
					local name = event.initiator:getName()
					if type(name)=="string" and name:find('^evt%-shiptercept') then
						mist.removeEventHandler(shipDieEvent)
						shipDieEvent = nil
						trigger.action.outTextForCoalition(2,'Enemy supply ship destroyed.\n+500 credits',15)
						bc:addFunds(2,500)
					end
				end
			end
		end
		shipDieEvent = mist.addEventHandler(shipDied)
	end,
	canExecute = function()
		if math.random(1,100) < 70 then return false end

		if Group.getByName('evt-shiptercept1') then return false end
		if Group.getByName('evt-shiptercept2') then return false end
		if Group.getByName('evt-shiptercept3') then return false end

		return true
	end
})


Group.getByName('evt-cargointercept1'):destroy()
Group.getByName('evt-cargointercept2'):destroy()
Group.getByName('evt-cargointercept3'):destroy()
local cargoDieEvent = nil
evc:addEvent({
	id='cargointercept',
	action = function()

		local planes = {'evt-cargointercept1','evt-cargointercept2','evt-cargointercept3'}
		local choice = math.random(1,#planes)

		mist.respawnGroup(planes[choice], true)

		local cargoDie = function(event)
			if event.id==30 then
				if event.initiator and event.initiator.getName then
					local name = event.initiator:getName()
					if type(name)=="string" and name:find('^evt%-cargointercept') then
						mist.removeEventHandler(cargoDieEvent)
						cargoDieEvent = nil
						trigger.action.outTextForCoalition(2,'Enemy cargo plane destroyed.\n+500 credits',15)
						bc:addFunds(2,500)
					end
				end
			end
		end
		cargoDieEvent = mist.addEventHandler(cargoDie)
	end,
	canExecute = function()
		if math.random(1,100) < 70 then return false end

		if bc:getZoneByName('Alpha').side ~= 1 then return false end
		if bc:getZoneByName('Abu Musa Island').side ~= 1 then return false end

		if Group.getByName('evt-cargointercept1') then return false end
		if Group.getByName('evt-cargointercept2') then return false end
		if Group.getByName('evt-cargointercept3') then return false end

		return true
	end
})

mc = MissionCommander:new({side = 2, battleCommander = bc, checkFrequency = 60})
mc:trackMission({
	title = "Intercept cargo plane",
	description = "Find and destroy the enemy cargo plane near Kerman, heading for Al Maktoum Intl.",
	messageStart = "New mission: Intercept cargo plane",
	messageEnd = "Mission ended: Intercept cargo plane",
	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
	endAction = function() trigger.action.outSoundForCoalition(2,"cancel.ogg") end,
	isActive = function()
		if Group.getByName('evt-cargointercept1') then return true end
		if Group.getByName('evt-cargointercept2') then return true end
		if Group.getByName('evt-cargointercept3') then return true end

		return false
	end
})


mc:trackMission({
	title = "Destroy cargo ship at Alpha",
	description = "Find and destroy the enemy cargo ship at Alpha, heading towards  Abu Musa Island",
	messageStart = "New mission: Destroy cargo ship",
	messageEnd = "Mission ended: Destroy cargo ship",
	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
	endAction = function() trigger.action.outSoundForCoalition(2,"cancel.ogg") end,
	isActive = function()
		if Group.getByName('evt-shiptercept1') then return true end
		if Group.getByName('evt-shiptercept2') then return true end
		if Group.getByName('evt-shiptercept3') then return true end

		return false
	end
})

--mc:trackMission({
--	title = "Destroy SCUDS",
--	description = "SCUDS have been spotted at Tunb Island AFB.\nDestroy them before they can launch their missiles",
--	messageStart = "New mission: Destroy SCUDS",
--	messageEnd = "Mission ended: Destroy SCUDS",
--	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
--	endAction = function() trigger.action.outSoundForCoalition(2,"cancel.ogg") end,
--	isActive = function()
--		local gr = Group.getByName('tunbislandafb-scud-1')
--		if gr then return true else return false end
--	end
--})


--Senaki Attack
--mc:trackMission({
--	title = "Destroy artillery",
--	description = "Artillery has been spotted heading towards Bandar Lengeh from the direction of Bandar Abbas Intl.\nDestroy them before they get in range.",
--	messageStart = "New mission: Destroy artillery",
--	messageEnd = "Mission ended: Destroy artillery\n+200 credits",
--	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
--	endAction = function() trigger.action.outSoundForCoalition(2,"cancel.ogg") end,
--	reward = 200,
--	isActive = function()
--		local gr = Group.getByName('bandarabbasintl-attack-bandarlengeh')
--		if gr then return true else return false end
--	end
--})

mc:trackMission({
	title = "Intercept Bombers",
	description = "Enemy bombers spotted to the north-east\nDestroy them before they get in range.",
	messageStart = "New mission: Intercept Bombers",
	messageEnd = "Mission ended: Intercept Bombers",
	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
	endAction = function() trigger.action.outSoundForCoalition(2,"cancel.ogg") end,
	isActive = function()
		local gr = Group.getByName('evt-bomber')
		if gr then return true else return false end
	end
})

mc:trackMission({
	title = "Intercept enemy airstrike",
	description = "Enemy aircraft conducting an airstrike from the north-east\nDestroy them before they get in range.",
	messageStart = "New mission: Intercept enemy airstrike",
	messageEnd = "Mission ended: Intercept enemy airstrike",
	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
	endAction = function() trigger.action.outSoundForCoalition(2,"cancel.ogg") end,
	isActive = function()
		local gr = Group.getByName('evt-cas')
		if gr then return true else return false end
	end
})

resupplyTarget = nil
mc:trackMission({
	title = function() return "Resupply "..resupplyTarget end,
	description = function() return "Deliver supplies to "..resupplyTarget end,
	messageStart = function() return "New mission: Resupply "..resupplyTarget end,
	messageEnd = function() return "Mission ended: Resupply "..resupplyTarget end,
	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
	endAction = function()
		resupplyTarget = nil
		trigger.action.outSoundForCoalition(2,"cancel.ogg")
	end,
	isActive = function()
		if not resupplyTarget then return false end

		local targetzn = bc:getZoneByName(resupplyTarget)
		return targetzn:canRecieveSupply()
	end
})

attackTarget = nil
mc:trackMission({
	title = function() return "Attack "..attackTarget end,
	description = function() return "Destroy enemy forces at "..attackTarget end,
	messageStart = function() return "New mission: Attack "..attackTarget end,
	messageEnd = function() return "Mission ended: Attack "..attackTarget end,
	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
	endAction = function()
		attackTarget = nil
		trigger.action.outSoundForCoalition(2,"cancel.ogg")
	end,
	isActive = function()
		if not attackTarget then return false end

		local targetzn = bc:getZoneByName(attackTarget)
		return targetzn.side == 1
	end
})

captureTarget = nil
mc:trackMission({
	title = function() return "Capture "..captureTarget end,
	description = function() return captureTarget.." is neutral. Capture it by delivering supplies" end,
	messageStart = function() return "New mission: Capture "..captureTarget end,
	messageEnd = function() return "Mission ended: Capture "..captureTarget end,
	startAction = function() trigger.action.outSoundForCoalition(2,"ding.ogg") end,
	endAction = function()
		captureTarget = nil
		trigger.action.outSoundForCoalition(2,"cancel.ogg")
	end,
	isActive = function()
		if not captureTarget then return false end

		local targetzn = bc:getZoneByName(captureTarget)
		return targetzn.side == 0 and targetzn.active
	end
})

function generateCaptureMission()
	if captureTarget ~= nil then return end

	local validzones = {}
	for _,v in ipairs(bc.zones) do
		if v.side == 0 and v.active and v.zone ~= "Substation West" and v.zone ~= "Substation East" then
			table.insert(validzones, v.zone)
		end
	end

	if #validzones == 0 then return end

	local choice = math.random(1, #validzones)
	if validzones[choice] then
		captureTarget = validzones[choice]
		return true
	end
end

function generateAttackMission()
	if attackTarget ~= nil then return end

	local validzones = {}
	for _,v in ipairs(bc.connections) do
		local to = bc:getZoneByName(v.to)
		local from = bc:getZoneByName(v.from)

		if from.side ~= to.side and from.side ~= 0  and to.side ~= 0 and from.active and to.active then
			if from.side == 1 then
				table.insert(validzones, from.zone)
			elseif to.side == 1 then
				table.insert(validzones, to.zone)
			end
		end
	end

	if #validzones == 0 then return end

	local choice = math.random(1, #validzones)
	if validzones[choice] then
		attackTarget = validzones[choice]
		return true
	end
end

function generateSupplyMission()
	if resupplyTarget ~= nil then return end

	local validzones = {}
	for _,v in ipairs(bc.zones) do
		if v.side == 2 and v:canRecieveSupply() then
			table.insert(validzones, v.zone)
		end
	end

	if #validzones == 0 then return end

	local choice = math.random(1, #validzones)
	if validzones[choice] then
		resupplyTarget = validzones[choice]
		return true
	end
end

timer.scheduleFunction(function(_, time)
	if generateCaptureMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 20)

timer.scheduleFunction(function(_, time)
	if generateAttackMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 40)

timer.scheduleFunction(function(_, time)
	if generateSupplyMission() then
		return time+300
	else
		return time+120
	end
end, {}, timer.getTime() + 60)

mc:init()
