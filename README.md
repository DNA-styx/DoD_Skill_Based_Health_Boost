# DoD Skill Based Health Boost

**Version:** 1.9.0  
**Author:** Combined by ChatGPT using HLStatsX API and DoD SpawnHealth 1.0 by FeuerSturm  
**HLStatsX API:** https://github.com/NomisCZ/hlstatsx-community-edition  
**DoD SpawnHealth 1.0:** https://dodsplugins.mtxserv.fr/viewtopic.php?f=6&t=173  

---

## Overview

This SourceMod plugin for **Day of Defeat: Source** gives players a **health boost based on their HLStatsX skill**.  

- Players with skill below the configured threshold receive higher health.  
- Boost is applied **on spawn** and **immediately after HLStats data is received** if the player is alive.  
- Config and logging files are **auto-generated on first run**.  

---

## Features

- Skill-based health boost  
- Configurable health and skill threshold  
- Debug logging for requests, responses, and boosts  
- Automatic retry if HLStats request fails  
- Logs stored in `addons/sourcemod/logs/dod_skill_health_boost.log`  
- Config stored in `cfg/sourcemod/dod_skill_health_boost.cfg`  

---

## CVARs

| CVAR | Default | Description |
|------|---------|-------------|
| dod_skill_hp | 200 | Health applied to players below the skill threshold |
| dod_skill_max | 1000 | Maximum HLStats skill to qualify for boost |
| dod_skill_debug | 1 | Enable debug logging (1 = on, 0 = off) |

- CVARs are **created automatically** on first run.  
- Logging only occurs if `dod_skill_debug` is enabled.

**Example usage via RCON:**
```
sm_cvar dod_skill_hp 250
sm_cvar dod_skill_max 15000
sm_cvar dod_skill_debug 1
```

---

## Logs

Debug and boost events appear in the log if `dod_skill_debug` is enabled.  
Example log entries:
```
[REQUEST] HLStats query for DNA.styx (13) returned 1  
[RESPONSE] HLStats skill for DNA.styx (13): 1000  
[BOOST] DNA.styx (13) | skill=1000 <= 1100 | health=200  
```
---

## Installation

2. Copy `hlstatsx_api.smx` to `addons/sourcemod/plugins/`.  
2. Copy `dod_skill_health_boost.smx` to `addons/sourcemod/plugins/`.  
3. Restart the map or server.  
4. The plugin will auto-create `.cfg` on first run.  
5. Adjust CVARs as needed via RCON or the `.cfg` file.  
6. The plugin will auto-create `.log` once enabled.  

---

## Notes

- Boost is applied **on spawn** and **immediately if the player is alive** when HLStats responds.  
- Skill is used because HLStatsX kills may not always accurately reflect total progress.  
- Designed for **Day of Defeat: Source** servers using HLStatsX.  

---

## License

This plugin is provided as-is for public use. Original HLStatsX API and DoD SpawnHealth 1.0 credit remain with their respective authors.
