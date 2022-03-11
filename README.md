# Endless Sky Plugin: Spacefarer

This is a plugin for the free open source game: [Endless Sky][ES].  The theme
song for this plugin is [The Wanderer][the-wanderer].

# Development status

![image](https://user-images.githubusercontent.com/875669/155867171-af301f43-8408-4db2-9430-e4f4a1a05843.png)

**Alpha:** critical story elements are broken due to being unable to loot
outfits from disabled ships.  However, we're playing through it and will address
the issues as we hit them.

- Because Jump Drives are not plunderable there's critical story elements
  inaccessible.  We're working on addressing this issue.  As support is added,
  we'll check it off.  If all are checked off we'll move out of alpha status.
  - [x] UNBLOCKED Sheragi (No second JD for retrieving Emerald Sword)
  - [x] UNBLOCKED Wanderer (give to Unfettered)
  - [ ] Syndicate Checkmate (not given first JD)
- [ ] Remove 2nd Jump drive granted during Sheragi campaign.

# Gameplay Mechanics Changes

In an effort to add a unique re-playable experience to Endless Sky this plugin
aims to minimally change the vanilla experience except to place a few
constraints upon the player.

Constraints include:

- One Jump Drive
- Outfits cannot be looted (except for when a mission calls for it)
- Ships cannot be captured
- Critical story elements grant necessary outfits and ships as mission rewards

# Known issues

- Critical story elements blocked.  See Development status section.
- Outfits are not plunderable but cargo on a ship can still be plundered.  This
  is a limitation in what can be accomplished in plugins.  We accept this as a
  limitation and have no plans to change it.
- [Some outfits](metadata/skip-outfits.txt) are lootable because "mission NPCs"
  can't offer boarding missions.  As such, there's no workaround at this time.
  We have [a mission available][fw-drone] should this game behavior change.
- Navy licenses are granted at the end of Free Worlds campaign.  This is
  intentional because the player cannot capture Navy ships.  When a Navy
  campaign is made available we'll remove the stop-gap mission associated with
  it.


See also [credits](credits.md).

[ES]: https://github.com/endless-sky/endless-sky
[the-wanderer]: https://www.youtube.com/watch?v=FCW0HviPEEY
[fw-drone]: metadata/fw-drone-mission.txt
