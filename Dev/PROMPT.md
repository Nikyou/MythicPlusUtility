# Task: Refactor, fix Talent Highlight, and add Spell Settings to "Mythic Plus Utility" (WoW Midnight retail 12.x addon)

## Context
- Repository: `MythicPlusUtility` (current branch `ability_settings`). Read `README.md` first for what the addon does.
- Reference addons are in `C:\Users\nikita.goloviznins\Documents\Lua\Addons`. Use them only as reference material.
  Don't copy code from them.
  - `TalentLoadoutsEx`: the talent loadout addon the author uses. Talent Highlight must work with it.
- The embedded libraries are in this repo's `Libs/`: Ace3 (including AceConfig-3.0, AceGUI-3.0, AceDBOptions-3.0),
  LibDeflate, LibCustomGlow, LibDBIcon, LibSharedMedia, and others. Read library source there, e.g. for the AceConfig
  analysis.
  - `Libs/` is gitignored and comes from `.pkgmeta` externals. Never edit or commit it.
  - Don't add new libraries unless you give a reason. If you do, add them to `.pkgmeta` and the .toc.
- Mockups are in `Dev/`: `ability settings.png`, `racial settings.png`, and `ability and racial when clicked on button.png`.
  `Dev/Tags.txt` has the tag list with descriptions.

## Released version takes priority
`C:\Users\nikita.goloviznins\Documents\Lua\Addons\MythicPlusUtility` is the released 1.4.7 that runs in game. Some
bugs on this branch came from merging older branch commits. Before anything else, diff the repo against that folder:
- Where they differ, the released version wins.
- Exceptions: the intended .toc lines `## Interface: 120105` and `## Version: @project-version@` stay as they are in
  the repo.

Differences I already found:
- `MythicPlusUtility.toc` lists `Variables.lua` twice. The released version lists it once.
- `InstancesData.lua`, Seat of the Triumvirate, "Coalesced Void NPC" entry: the released version has `[creature_root]`
  and the branch lost it. Restore it.

Every other Lua file and the locales match the released version. So the remaining bugs listed under "Refactor" also
exist in game.

## Work in phases, and stop where marked
1. **Analysis (no code changes).** Report:
   - your refactor findings (see "Refactor")
   - the root cause of each Talent Highlight bug
   - whether AceConfig can build the Spell Settings UI (see "UI technology")
   - the data model you propose

   **Stop and wait for my answer.** The UI technology choice in particular is mine to make.
2. Refactor and bug fixes.
3. Talent Highlight fixes.
4. Spell Settings: the data layer and runtime integration first, then the UI, then import/export, then the
   notifications.
5. Give me a manual in-game test checklist. You can't run WoW, so say what you could not verify. If a Lua 5.1
   interpreter is available, syntax-check each changed file (`luac -p`).

Only edit files in the working tree. Don't run anything that changes git state: no `git add`, commit, stash,
branch, checkout, reset, merge, rebase, tag, or push. I review and commit the changes myself. Read-only git commands
(`status`, `diff`, `log`, `show`) are fine.

Versioning:
- The new version is **1.5.0**. Leave `## Version: @project-version@` alone, because the packager fills it in from
  the git tag.
- TOC bump: `## Interface` must be `120105`. If the .toc already says that, leave it as it is and only record the
  bump in the changelog.

## Platform constraints
- Target `## Interface: 120105`. Use `C_*` namespaces and no deprecated globals.
- Midnight restrictions: never compare, do arithmetic on, or concatenate a value that can be secret without checking
  `issecretvalue()` first. Never touch protected frames in combat. Settings already open only out of combat. Keep it
  that way for every new window.
- No taint: don't write keys onto Blizzard frames or tables. Keep your own lookup tables (weak-keyed where they map
  Blizzard objects). Use `hooksecurefunc` / `EventRegistry` callbacks, never replace Blizzard methods.
- Check APIs against current 12.x sources and warcraft.wiki.gg. Don't guess method names. If you can't verify one,
  say so.

## Code style (important)
The result must read as if the original author wrote it.
- Mimic the existing code:
  - 4-space indent, 130-column limit, 2-space continuation indent, trailing comma in multi-line tables
    (`.vscode/1.lua-format`)
  - `MythicPlusUtility:PascalCase` methods, camelCase locals
  - `local Variables = MythicPlusUtility.Variables` and `local L = LibStub("AceLocale-3.0"):GetLocale(...)` at the
    top of files
  - AceConfig handlers named `GetValueX` / `SetValueX` that resolve the db path from `info`
  - one-line bodies for trivial functions
  - `format(...)`, `C_Timer.NewTimer`
- Use comments sparingly, as the author does: short section labels like `-- Glow Settings` or `-- Trash`, and
  `-- Spell Name` after data entries. No doc blocks, no explanatory or "why" comments, no banners, no emoji, no
  "NOTE:"/"TODO:" chatter, no summaries of what a function does.
- Deviate from the existing style only when it costs performance, and tell me where you did.
- New user-facing strings go through AceLocale, added only to `Locales/enUS.lua` (other locales come from the
  CurseForge localisation workflow). Use English text as keys, like the existing entries.

## Refactor
Analyse the whole addon and refactor it. Keep behaviour and the SavedVariables layout compatible. Any layout change
needs a migration in `MigrateOldSettings`. Keep the current file split unless a new file is clearly warranted (the
Spell Settings UI can get its own file). Problems I already know about; verify each one and fix it:
- `Variables.lua` is listed twice in `MythicPlusUtility.toc`.
- `Variables.supportedTags` has `physical_debuf` (typo). `[physical_debuff]` in `InstancesData.lua` is silently dropped.
- `PopulateCurrentAbilitiesListWithInstanceData` reads `self.db.profile.hideNotImportant`. That setting was migrated
  to `generalSettings.hideNotImportant`, so "Hide not Important" doesn't work.
- `GetZoneNameByInstanceId` writes the zone name into `db.spellIdToIconId` instead of `db.instanceIDToZoneName`.
- `OnInitialize` calls `ModelContainer:SetSize` twice.
- `MigrateOldSettings` only migrates truthy values. A user's `false` for `hideOnStart` is lost.
- `FormatSpellsData`, `GetCharacterInfo`, and `CreateCurrentAbilitiesList` write runtime fields (`spellId`,
  `spellName`, `tagsTable`, `isKnown`, `altSpellId`) into the static `SpellsData.lua` tables. Stop mutating the
  defaults. This also matters for Spell Settings.
- Duplicated logic: the three `Extract*FromInstanceData` loops, the tag parser (twice), the known-spell/alternatives
  check (three copies), and the two branches of `FormatSpellsData`. Also repeated `tablecopy` of whole lists.

Report anything else you find (bugs, dead code, performance) in the Phase 1 report before you change it.

## Talent Highlight bugs (`TalentFrameHighlight.lua`)
Two reported issues:
1. Highlight textures sometimes appear in the center of the screen instead of on talent buttons.
2. When inspecting another player's talents, highlights appear on their talents.

Highlight must work both with the standard Blizzard UI and with TalentLoadoutsEx. TalentLoadoutsEx reuses
`PlayerSpellsFrame.TalentsFrame` and loads loadouts into it. Read its `modules/frame.lua`, `list.lua`, and
`import.lua` to see how it changes the displayed tree.

Leads to check. These are not confirmed causes:
- Overlays are created with `buttonFrame` as parent, but `SetPoint` only runs in `UpdateAnchers` when the button
  *changes*, so a fresh overlay may never be anchored. `GetTalentButtonByNodeID` can also return `nil`, which
  creates an overlay with no parent.
- Talent buttons come from a pool and get reused for other nodes, specs, loadouts, and the inspect view. Overlays
  parented to a button follow it.
- Inspecting reuses `PlayerSpellsFrame` (`TalentsFrame:IsInspecting()`), and `PlayerSpellsFrame.OpenFrame` fires
  for it.
- `UpdateSpec` uses `C_ClassTalents.GetLastSelectedSavedConfigID` rather than the config the frame is actually
  showing.
- Nothing refreshes the overlays when the tree is redrawn while the frame stays open (loadout change, spec tab,
  TalentLoadoutsEx apply).
- `Blizzard_PlayerSpells` is load-on-demand.

Preferred direction: tie overlays to the button the frame currently shows for a node. Resolve the spell from the
button's current node on every refresh, and hide everything while inspecting. Hook the talents frame's own
refresh/acquire path instead of polling. Highlights must also cover custom abilities and respect disabled spells
(see below).

## New feature: Spell Settings
This covers the two README To Do items: "disable specific spells" and "add custom abilities". Custom dungeon entries
are **out of scope**.

### Placement
A new Blizzard settings sub-category, "Spell Settings", placed directly under the main "Mythic Plus Utility" entry and
above "Profiles". `/mpu spells` opens it. It has these tabs:
1. **Class spells**
2. **Racials**
3. **Professions**
4. **Custom Abilities**
5. **Import / Export**

### Class spells tab (`Dev/ability settings.png`)
- A "Show current class" checkbox jumps to and locks the player's class. Otherwise a class dropdown is shown, with
  each class name in its class colour.
- Groups: class general (with the class icon, `Variables.classToIcon`), then each spec (spec icon and localised spec
  name from `GetSpecializationInfoByID`). The data comes from `utilityAbilities[CLASS]` and
  `utilityAbilities[specID]` in `SpellsData.lua`, with specs from `classSpecialisations`.
- Each row has these columns, with a header row:
  - **Override** checkbox. When off, the spell uses the code defaults and the other controls in the row are
    disabled. The stored values are kept, so turning it back on restores them.
  - **Enabled** checkbox. Off means the spell is hidden from the utility window (including the "Remove" list) and from
    Talent Highlight.
  - Spell icon and localised name, with a spell tooltip on hover.
  - **Change tags** checkbox. Applies the tag overrides from the editor. When off, they're kept but ignored.
  - A button that opens the editor window for this spell.
- A spell can appear in more than one container (for example Cleanse Spirit in Elemental and Enhancement). Key
  overrides by container (class token / specID) plus spellId, so each row is independent.

### Racials tab (`Dev/racial settings.png`) and Professions tab
Same rows as Class spells, with no class/spec grouping. The data comes from `utilityAbilitiesRacials` and
`utilityAbilitiesProfessions`.

### Editor window (`Dev/ability and racial when clicked on button.png`)
- **Default** section, read-only:
  - the default tags string
  - `override` (hidden if none)
  - `alternatives` (hidden if none)
  - the `baseline` checkbox
  - a "Reset to default" button with a confirmation
- **Settings** section:
  - `override`: one spell ID, validated, empty means default
  - `alternatives`: a list of spell IDs, validated, empty means default
  - `baseline`: tri-state, `nil` means default
- **Tags** section, as tabs:
  - **Crowd Control**, with sub-headers Cast-time CC (`cast_cc_*`), Insta-cast CC (`cc_*`), and Special CC
    (`cc_banish`, `cc_cyclone`)
  - **Creature** (`creature_*`)
  - **Dispel** (removable effects, `magic_debuff`, `physical_debuff`, `curse_target`)
  - **Movement** (`player_jump`, `player_movement_immune`, and similar)
  - **Other** (`self_only`, `targeted_avoid`, `alter_time`, professions)

  Propose the final mapping in Phase 1.
- Each tag is a tri-state checkbox:
  - `true` = add
  - `false` = remove
  - `nil` = default

  Its tooltip is a localised description taken from `Dev/Tags.txt` / the `supportedTags` comments. Keep the tag
  metadata (category, order, description key) in `Variables.lua` next to `supportedTags`. Don't expose `important`,
  `super_important`, or the commented-out `snare_jet`.
- Tag help:
  - At the top of the Tags section, one short line explains the three checkbox states: added, removed, default.
  - Each tag tab has a "?" info icon. Its tooltip lists every tag in that tab with its description, grouped by the
    sub-headers.

  Build the help from the same tag metadata so it stays in sync. The custom ability editor shows the same help.
- Check the actual tri-state cycle order in AceGUI's CheckBox and map it to the semantics above.

### Custom Abilities tab
- Same layout as Class spells: class dropdown, "Show current class", class general and spec groups. The dropdown has
  an extra **All classes** entry.
- Empty by default. Each group has an "Add" control: a spell ID input, validated with `C_Spell.DoesSpellExist`, that
  shows the icon and name before confirming.
- Each custom ability has:
  - Enabled
  - a Delete button with a confirmation
  - the editor button. The editor uses the same Settings and Tags sections, with no Default section. It also has a
    `pet` checkbox, since `IsSpellKnownHandler` uses it.
- If the spell ID already exists as a default spell for that class/spec (or for the class/spec of any class when it
  is "All classes"), still allow it to be added. Show a warning mark on the row with a tooltip saying it won't be
  used because a class spell exists and should be edited instead. At runtime the default spell wins.

### Import / Export tab
- Export and import only the spell settings (overrides and custom abilities), separate from the profile export.
- Reuse the existing pattern in `Profiles.lua`: AceSerializer, LibDeflate, `EncodeForPrint`, and a `meta` block with
  addon name, type, and schema version.
- Validate on import:
  - the structure
  - spell IDs are numbers
  - tags are in `supportedTags`
  - container keys are known classes/specs, `ALL`, racial, or profession

  Drop invalid entries and report how many were dropped.
- Offer **Merge** or **Replace**, with a confirmation and a summary.

### Reset
Each tab gets a "Reset" button with a confirmation:
- Class spells: resets the selected class.
- Racials and Professions: resets the tab.
- Custom Abilities: deletes the custom abilities of the selected class.

### Storage
- Store everything in the **profile**, e.g. `profile.spellSettings = {overrides = {...}, custom = {...}}`, so it
  follows profile switching and the full profile export.
- Store only differences from the defaults (`nil` = default). Future `SpellsData.lua` updates then still reach users
  who haven't overridden that field.

### Change notifications
Use a small, non-modal, dismissible notice: not a StaticPopup, never shown in combat, at most once per login. It must
be obvious which addon it comes from: the title bar shows the addon logo (`Interface\AddOns\MythicPlusUtility\logo`)
and "Mythic Plus Utility". It lists the affected spells with icons and has a button that opens Spell Settings. Show it
when:
- the code default of a spell the user has overridden changed since the override was saved. Store a compact
  fingerprint of the defaults (tags, override, alternatives, baseline) with each override and compare it on login.
- a custom ability now also exists as a default spell for its class/spec.

After the user dismisses it, update the stored fingerprints and acknowledged flags so the same change isn't reported
again.

### Runtime integration
- Build one "effective abilities" view, recalculated on login, profile change, spec change, and any Spell Settings
  change. It merges the defaults, overrides (only where Override is on), and custom abilities.
- Every consumer reads from this view instead of the raw `SpellsData.lua` tables:
  - `ExtractSpellsFromDB`
  - `FormatSpellsData`
  - `GetCharacterInfo`
  - `CreateCurrentAbilitiesList`
  - `UpdateCurrentAbilitiesList` (it currently looks up `utilityAbilities[...]` directly for `override`)
  - `PopulateCurrentAbilitiesListWithInstanceData`
  - Talent Highlight
- Settings changes update an open utility window and Talent Highlight live (`Frame:ChangeInstance()` and the highlight
  refresh).

### UI technology
Use AceConfig if it can do this cleanly, so it matches `Options.lua` and `Profiles.lua`. Otherwise use a hybrid:
AceConfig for the tabs and lists, and a hand-built window for the editor. In Phase 1, check each of these against the
actual AceConfig/AceGUI source:
- aligned columns with a header row
- icon and name in a row, with a spell tooltip
- per-row disabled state
- tri-state toggles
- rebuilding args when the class changes
- a separate window for the editor (`AceConfigDialog:Open` on its own registered table)
- tabs plus sub-headers inside that window
- settings category ordering

Report what works and what doesn't, recommend one option, and wait for my decision.

## Docs
- `README.md`: remove the two finished To Do items (keep "custom dungeon entries") and describe Spell Settings under
  Key Features. Add `/mpu spells` to Usage.
- `CHANGELOG.md`: add entries at the top under `#### 1.5.0`, in the existing format (`### Section`, `* item`). Use
  sections such as Features, Fixes, and Dungeon Entries (for the restored `[creature_root]`), matching earlier entries.
  Include a "TOC bump" line, since the released 1.4.7 was `120100`.

## Deliverables
- The code changes as uncommitted edits in the working tree.
- The Phase 1 report.
- A final summary: what changed per file, the bugs fixed, any style deviations made for performance, and the manual
  test checklist. The checklist must cover:
  - Talent Highlight with the Blizzard UI and with TalentLoadoutsEx
  - loadout and spec switches while the frame is open
  - inspecting another player
  - overrides, disabling, and custom abilities (including duplicates and All classes)
  - reset
  - import/export (merge and replace)
  - profile switch
  - the change notification
