Config = {}

Config.robberies = {
    ['jewelry'] = {
        label = "Negozio di Gioielli",
        position = { x = -631.43, y = -236.13, z = 38.05 },
        blipSprite = 617,
        blipColor = 47,
        blipScale = 0.8,
        blipText = "Rapina: Negozio di Gioielli",
        maxDistance = 10.0, -- Distanza massima per attivare la rapina (in metri)
        cooldown = 600, -- Tempo di attesa tra una rapina e l'altra (in secondi)
        requiredItems = {
            {name = "lockpick", label = "Grimaldello", count = 1}
        }
    },
    ['bank'] = {
        label = "Banca Centrale",
        position = { x = 150.0, y = -1040.0, z = 29.4 },
        blipSprite = 108,
        blipColor = 2,
        blipScale = 0.8,
        blipText = "Rapina: Banca Centrale",
        maxDistance = 15.0,
        cooldown = 900,
        requiredItems = {
            {name = "thermite", label = "Termite", count = 1}
        }
    }
}
