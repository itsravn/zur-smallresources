Config = Config or {}
Config.Birds = {
    Enable = true,
    StartHour = 6,
    EndHour = 9,
    CheckInterval = 5000,
    Chance = 2
}
Config.Cicada = {
    Enable = true,
    StartHour = 22,
    EndHour = 5,
    CheckInterval = 5000
}
Config.Melee = {
    Enable = true,
    WindupTime = 200,
    AnimDuration = 200
}
Config.BrakeLights = {
    Enable = true
}
Config.Blink = {
    Enable = true,
    MinInterval = 2000,
    MaxInterval = 5000,
    BlinkDuration = 200
}
Config.Heat = {
    Enable = true,
    StartHour = 11,
    EndHour = 17,
    WeatherType = "EXTRASUNNY",
    MoveSpeed = 0.85,
    ThirstTickRate = 60000,
    ThirstDeduction = 2.0
}
Config.GunEcho = {
    Enable = true,
    AudioBank = "DLC_HEIST_BIOLAB_PREP_SOUNDS",
    Sounds = {
        IndoorShot = "GUNSHOT_INDOOR",
        IndoorEcho = "ECHO",
        OutdoorShot = "GUNSHOT_OUTDOOR",
        OutdoorEcho = "ECHO_SHORT"
    },
    Delays = {
        Indoor = 1500,
        Outdoor = 500
    }
}
Config.FallDamage = {
    Enable = true,
    LightHeight = 3.0,
    LightDamage = 10,
    MediumHeight = 5.0,
    MediumDamage = 30,
    HeavyHeight = 10.0,
    HeavyDamage = 60,
    DeathHeight = 15.0
}
Config.DamageFX = {
    Enable = true,
    Thresholds = {
        Light = 10,
        Medium = 30,
        Heavy = 60
    },
    AnimDict = "combat@damage@rb_chest",
    Anims = {
        Light = "",
        Medium = "rb_chest_step_l",
        Heavy = "rb_chest_step_r_stagger"
    },
    ScreenEffect = "Damage",
    BloodDecalID = 1010
}
Config.Sandstorm = {
    Enable = true,
    Weathers = {"SMOG", "BLIZZARD", "EXTRASUNNY"},
    TimecycleModifier = "WATER_silo"
}
Config.OffRoad = {
    Enable = true,
    BannedClasses = {0, 2, 4, 6},
    SpeedThreshold = 80.0,
    Materials = {11, 12, 13, 24, 37},
    BurstChance = 5
}
Config.WeaponJam = {
    Enable = true,
    MaxContinuousShots = 45,
    CooldownTime = 2500
}
Config.GunSway = {
    Enable = true,
    InjuredThreshold = 150,
    TiredThreshold = 30.0,
    ShakeAmplitudeHeavy = 3.0,
    ShakeAmplitudeMedium = 1.5
}
Config.Dirt = {
    Enable = true,
    Materials = {11, 12, 13, 24, 37},
    MaxDirtLevel = 15.0
}
