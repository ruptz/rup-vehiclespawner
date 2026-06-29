--[[ Stock (base game) vehicle spawn names. ]]

local stock = {
    -- Compacts
    'asbo', 'blista', 'brioso', 'brioso2', 'brioso3', 'club', 'dilettante', 'dilettante2',
    'issi2', 'issi3', 'issi4', 'issi5', 'issi6', 'kanjo', 'panto', 'prairie',
    'rhapsody', 'weevil',
    -- Sedans
    'asea', 'asea2', 'asterope', 'asterope2', 'chavosv6', 'cinquemila', 'cog55', 'cog552',
    'cognoscenti', 'cognoscenti2', 'deity', 'driftchavosv6', 'drifthardy', 'driftvorschlag', 'emperor', 'emperor2',
    'emperor3', 'fugitive', 'glendale', 'glendale2', 'hardy', 'impaler5', 'ingot', 'intruder',
    'limo2', 'minimus', 'premier', 'primo', 'primo2', 'regina', 'rhinehart', 'romero',
    'schafter2', 'schafter5', 'schafter6', 'stafford', 'stanier', 'stratum', 'stretch', 'superd',
    'surge', 'tailgater', 'tailgater2', 'vorschlaghammer', 'warrener', 'warrener2', 'washington',
    -- SUVs
    'aleutian', 'astron', 'baller', 'baller2', 'baller3', 'baller4', 'baller5', 'baller6',
    'baller7', 'baller8', 'bjxl', 'castigator', 'cavalcade', 'cavalcade2', 'cavalcade3', 'contender',
    'dorado', 'dubsta', 'dubsta2', 'everon3', 'fq2', 'granger', 'granger2', 'gresley',
    'habanero', 'huntley', 'issi8', 'iwagen', 'jubilee', 'landstalker', 'landstalker2', 'mesa',
    'mesa2', 'novak', 'patriot', 'patriot2', 'radi', 'rebla', 'rocoto', 'seminole',
    'seminole2', 'serrano', 'squaddie', 'toros', 'vivanite', 'xls', 'xls2',
    -- Coupes
    'cogcabrio', 'driftfr36', 'exemplar', 'f620', 'felon', 'felon2', 'fr36', 'jackal',
    'kanjosj', 'oracle', 'oracle2', 'postlude', 'previon', 'sentinel', 'sentinel2', 'windsor',
    'windsor2', 'zion', 'zion2',
    -- Muscle
    'blade', 'brigham', 'broadway', 'buccaneer', 'buccaneer2', 'buffalo4', 'buffalo5', 'chino',
    'chino2', 'clique', 'clique2', 'coquette3', 'deviant', 'dominator', 'dominator10', 'dominator2',
    'dominator3', 'dominator4', 'dominator5', 'dominator6', 'dominator7', 'dominator8', 'dominator9', 'driftdominator10',
    'driftgauntlet4', 'driftyosemite', 'dukes', 'dukes2', 'dukes3', 'ellie', 'eudora', 'faction',
    'faction2', 'faction3', 'gauntlet', 'gauntlet2', 'gauntlet3', 'gauntlet4', 'gauntlet5', 'greenwood',
    'hermes', 'hotknife', 'hustler', 'impaler', 'impaler2', 'impaler3', 'impaler4', 'impaler6',
    'imperator', 'imperator2', 'imperator3', 'lurcher', 'manana2', 'moonbeam', 'moonbeam2', 'nightshade',
    'peyote2', 'phoenix', 'picador', 'ratloader', 'ratloader2', 'ruiner', 'ruiner2', 'ruiner3',
    'ruiner4', 'sabregt', 'sabregt2', 'slamvan', 'slamvan2', 'slamvan3', 'slamvan4', 'slamvan5',
    'slamvan6', 'stalion', 'stalion2', 'tahoma', 'tampa', 'tampa3', 'tampa4', 'tulip',
    'tulip2', 'vamos', 'vigero', 'vigero2', 'vigero3', 'virgo', 'virgo2', 'virgo3',
    'voodoo', 'voodoo2', 'weevil2', 'yosemite', 'yosemite2',
    -- Sports Classics
    'ardent', 'btype', 'btype2', 'btype3', 'casco', 'cheburek', 'cheetah2', 'cheetah3',
    'coquette2', 'coquette5', 'deluxo', 'driftcheburek', 'driftjester3', 'driftnebula', 'dynasty', 'fagaloa',
    'feltzer3', 'gt500', 'infernus2', 'jb700', 'jb7002', 'mamba', 'manana', 'michelli',
    'monroe', 'nebula', 'peyote', 'peyote3', 'pigalle', 'rapidgt3', 'retinue', 'retinue2',
    'savestra', 'stinger', 'stingergt', 'stromberg', 'swinger', 'toreador', 'torero', 'tornado',
    'tornado2', 'tornado3', 'tornado4', 'tornado5', 'tornado6', 'turismo2', 'uranus', 'viseris',
    'z190', 'zion3', 'ztype',
    -- Sports
    'alpha', 'banshee', 'banshee3', 'bestiagts', 'blista2', 'blista3', 'buffalo', 'buffalo2',
    'buffalo3', 'calico', 'carbonizzare', 'comet2', 'comet3', 'comet4', 'comet5', 'comet6',
    'comet7', 'coquette', 'coquette4', 'coquette6', 'corsita', 'coureur', 'cypher', 'drafter',
    'driftcypher', 'drifteuros', 'driftfuto', 'driftfuto2', 'driftjester', 'driftremus', 'driftsentinel', 'drifttampa',
    'driftzr350', 'elegy', 'elegy2', 'envisage', 'euros', 'eurosx32', 'everon2', 'feltzer2',
    'flashgt', 'furoregt', 'fusilade', 'futo', 'futo2', 'gauntlet6', 'gb200', 'growler',
    'hotring', 'imorgon', 'issi7', 'italigto', 'italirsx', 'jester', 'jester2', 'jester3',
    'jester4', 'jester5', 'jugular', 'khamelion', 'komoda', 'kuruma', 'kuruma2', 'locust',
    'lynx', 'massacro', 'massacro2', 'neo', 'neon', 'ninef', 'ninef2', 'niobe',
    'omnis', 'omnisegt', 'panthere', 'paragon', 'paragon2', 'paragon3', 'pariah', 'penumbra',
    'penumbra2', 'r300', 'raiden', 'rapidgt', 'rapidgt2', 'rapidgt4', 'raptor', 'remus',
    'revolter', 'rt3000', 'ruston', 'schafter3', 'schafter4', 'schlagen', 'schwarzer', 'sentinel3',
    'sentinel4', 'sentinel5', 'seven70', 'sm722', 'specter', 'specter2', 'stingertt', 'streiter',
    'sugoi', 'sultan', 'sultan2', 'sultan3', 'surano', 'tampa2', 'tenf', 'tenf2',
    'tropos', 'vectre', 'verlierer2', 'veto', 'veto2', 'vstr', 'zr350', 'zr380',
    'zr3802', 'zr3803',
    -- Super
    'adder', 'autarch', 'banshee2', 'bullet', 'champion', 'cheetah', 'cyclone', 'deveste',
    'emerus', 'entity2', 'entity3', 'entityxf', 'fmj', 'furia', 'gp1', 'ignus',
    'infernus', 'italigtb', 'italigtb2', 'krieger', 'le7b', 'lm87', 'nero', 'nero2',
    'osiris', 'penetrator', 'pfister811', 'pipistrello', 'prototipo', 'reaper', 's80', 'sc1',
    'scramjet', 'sheava', 'sultanrs', 'suzume', 't20', 'taipan', 'tempesta', 'tezeract',
    'thrax', 'tigon', 'torero2', 'turismo3', 'turismor', 'tyrant', 'tyrus', 'vacca',
    'vagner', 'vigilante', 'virtue', 'visione', 'voltic', 'voltic2', 'xa21', 'zeno',
    'zentorno', 'zorrusso',
    -- Motorcycles
    'akuma', 'avarus', 'bagger', 'bati', 'bati2', 'bf400', 'carbonrs', 'chimera',
    'cliffhanger', 'daemon', 'daemon2', 'deathbike', 'deathbike2', 'deathbike3', 'defiler', 'diablous',
    'diablous2', 'double', 'enduro', 'esskey', 'faggio', 'faggio2', 'faggio3', 'fcr',
    'fcr2', 'gargoyle', 'hakuchou', 'hakuchou2', 'hexer', 'innovation', 'lectro', 'manchez',
    'manchez2', 'manchez3', 'nemesis', 'nightblade', 'oppressor', 'oppressor2', 'pcj', 'pizzaboy',
    'powersurge', 'ratbike', 'reever', 'rrocket', 'ruffian', 'sanchez', 'sanchez2', 'sanctus',
    'shinobi', 'shotaro', 'sovereign', 'stryder', 'thrust', 'vader', 'vindicator', 'vortex',
    'wolfsbane', 'zombiea', 'zombieb',
    -- Off-road
    'bfinjection', 'bifta', 'blazer', 'blazer2', 'blazer3', 'blazer4', 'blazer5', 'bodhi2',
    'boor', 'brawler', 'bruiser', 'bruiser2', 'bruiser3', 'brutus', 'brutus2', 'brutus3',
    'caracara', 'caracara2', 'dloader', 'draugur', 'driftl352', 'dubsta3', 'dune', 'dune2',
    'dune3', 'dune4', 'dune5', 'everon', 'freecrawler', 'hellion', 'insurgent', 'insurgent2',
    'insurgent3', 'kalahari', 'kamacho', 'l35', 'l352', 'marshall', 'menacer', 'mesa3',
    'monster', 'monster3', 'monster4', 'monster5', 'monstrociti', 'nightshark', 'outlaw', 'patriot3',
    'rancherxl', 'rancherxl2', 'ratel', 'rcbandito', 'rebel', 'rebel2', 'riata', 'sandking',
    'sandking2', 'technical', 'technical2', 'technical3', 'terminus', 'trophytruck', 'trophytruck2', 'vagrant',
    'verus', 'winky', 'yosemite1500', 'yosemite3', 'zhaba',
    -- Industrial
    'bulldozer', 'cutter', 'dump', 'flatbed', 'flatbed2', 'guardian', 'handler', 'mixer',
    'mixer2', 'rubble', 'tiptruck', 'tiptruck2',
    -- Utility
    'airtug', 'armytanker', 'armytrailer', 'armytrailer2', 'baletrailer', 'boattrailer', 'boattrailer2', 'boattrailer3',
    'caddy', 'caddy2', 'caddy3', 'docktrailer', 'docktug', 'forklift', 'freighttrailer', 'graintrailer',
    'mower', 'proptrailer', 'raketrailer', 'ripley', 'sadler', 'sadler2', 'scrap', 'slamtruck',
    'tanker', 'tanker2', 'towtruck', 'towtruck2', 'towtruck3', 'towtruck4', 'tr2', 'tr3',
    'tr4', 'tractor', 'tractor2', 'tractor3', 'trailerlarge', 'trailerlogs', 'trailers', 'trailers2',
    'trailers3', 'trailers4', 'trailers5', 'trailersmall', 'trflat', 'tvtrailer', 'tvtrailer2', 'utillitruck',
    'utillitruck2', 'utillitruck3',
    -- Vans
    'bison', 'bison2', 'bison3', 'bobcatxl', 'boxville', 'boxville2', 'boxville3', 'boxville4',
    'boxville5', 'boxville6', 'burrito', 'burrito2', 'burrito3', 'burrito4', 'burrito5', 'camper',
    'gburrito', 'gburrito2', 'journey', 'journey2', 'minivan', 'minivan2', 'paradise', 'pony',
    'pony2', 'rumpo', 'rumpo2', 'rumpo3', 'speedo', 'speedo2', 'speedo4', 'speedo5',
    'surfer', 'surfer2', 'surfer3', 'taco', 'youga', 'youga2', 'youga3', 'youga4',
    'youga5',
    -- Cycles
    'bmx', 'cruiser', 'fixter', 'inductor', 'inductor2', 'scorcher', 'tribike', 'tribike2',
    'tribike3',
    -- Boats
    'avisa', 'dinghy', 'dinghy2', 'dinghy3', 'dinghy4', 'dinghy5', 'jetmax', 'kosatka',
    'longfin', 'marquis', 'patrolboat', 'predator', 'seashark', 'seashark2', 'seashark3', 'speeder',
    'speeder2', 'squalo', 'submersible', 'submersible2', 'suntrap', 'toro', 'toro2', 'tropic',
    'tropic2', 'tug',
    -- Helicopters
    'akula', 'annihilator', 'annihilator2', 'buzzard', 'buzzard2', 'cargobob', 'cargobob2', 'cargobob3',
    'cargobob4', 'cargobob5', 'conada', 'conada2', 'frogger', 'frogger2', 'havok', 'hunter',
    'maverick', 'maverick2', 'polmav', 'savage', 'seasparrow', 'seasparrow2', 'seasparrow3', 'skylift',
    'supervolito', 'supervolito2', 'swift', 'swift2', 'valkyrie', 'valkyrie2', 'volatus',
    -- Planes
    'alkonost', 'alphaz1', 'avenger', 'avenger2', 'avenger3', 'avenger4', 'besra', 'blimp',
    'blimp2', 'blimp3', 'bombushka', 'cargoplane', 'cargoplane2', 'cuban800', 'dodo', 'duster',
    'duster2', 'howard', 'hydra', 'jet', 'lazer', 'luxor', 'luxor2', 'mammatus',
    'microlight', 'miljet', 'mogul', 'molotok', 'nimbus', 'nokota', 'pyro', 'raiju',
    'rogue', 'seabreeze', 'shamal', 'starling', 'streamer216', 'strikeforce', 'stunt', 'titan',
    'titan2', 'tula', 'velum', 'velum2', 'vestra', 'volatol',
    -- Service
    'airbus', 'brickade', 'brickade2', 'bus', 'coach', 'pbus2', 'rallytruck', 'rentalbus',
    'taxi', 'tourbus', 'trash', 'trash2', 'wastelander',
    -- Emergency
    'ambulance', 'fbi', 'fbi2', 'firebolt', 'firetruk', 'lguard', 'pbus', 'polcaracara',
    'polcoquette4', 'poldominator10', 'poldorado', 'polgauntlet', 'polgreenwood', 'police', 'police2', 'police3',
    'police4', 'police5', 'policeb', 'policeb2', 'policeold1', 'policeold2', 'policet', 'policet3',
    'polimpaler5', 'polimpaler6', 'polterminus', 'pranger', 'riot', 'riot2', 'sheriff', 'sheriff2',
    -- Military
    'apc', 'barracks', 'barracks2', 'barracks3', 'barrage', 'chernobog', 'crusader', 'halftrack',
    'khanjali', 'minitank', 'rhino', 'scarab', 'scarab2', 'scarab3', 'thruster', 'trailersmall2',
    'vetir',
    -- Commercial
    'benson', 'benson2', 'biff', 'cerberus', 'cerberus2', 'cerberus3', 'hauler', 'hauler2',
    'mule', 'mule2', 'mule3', 'mule4', 'mule5', 'packer', 'phantom', 'phantom2',
    'phantom3', 'phantom4', 'pounder', 'pounder2', 'stockade', 'stockade3', 'stockade4', 'terbyte',
    -- Trains
    'cablecar', 'freight', 'freight2', 'freightcar', 'freightcar2', 'freightcar3', 'freightcont1', 'freightcont2',
    'freightgrain', 'metrotrain', 'tankercar',
    -- Open Wheel
    'formula', 'formula2', 'openwheel1', 'openwheel2',
}

-- fast fast fast!!!!
StockVehicles = {}
for i = 1, #stock do
    StockVehicles[stock[i]] = true
end
