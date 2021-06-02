# Miscellaneous Stuff

## Remapping tilde key in Russian Keyboard

**Motivation**: I have a external bluetooth keyboard with Russian layout but want to remap the tilde key to original position.

**Steps:**

- start `Automator.app`
- select `Application`
- click `Show library` in the toolbar (if hidden)
- add `Run shell script` (from the `Actions/Utilities`)
- copy & paste this script into the window:
  ```shell
    hidutil property --set '{"UserKeyMapping": [{"HIDKeyboardModifierMappingSrc": 0x700000064, "HIDKeyboardModifierMappingDst": 0x700000035}]}' 
  ```
- run & test.
- Save as `remap_tilde_us_keyboard.app` in `home` directory. 
- go to `System Preferences -> Accounts -> Login items`.
- add this app
- You can also add the keyboard shorcut service to set/reset the key mappings. (Refer the blog below)

- References: [Blog](https://bezdelev.com/hacking/fix-tilde-key-mac/), [Stackoverflow](https://stackoverflow.com/questions/6442364/running-script-upon-login-mac/13372744#13372744).

## Convert PPT to PDF using right click QuickAction
- start `Automator.app`
- select `Quick Action`
- add `Run AppleScript` (from the `Actions/Utilities`)
- select `documents` in `Finder` from the dropdowns `Workflow receives current`
- copy & paste this script into the window:
  ```
    on run {input, parameters}
        set theOutput to {}
        tell application "Microsoft PowerPoint" -- work on version 15.15 or newer
            launch
            repeat with i in input
                set t to i as string
                if t ends with ".ppt" or t ends with ".pptx" then
                    set pdfPath to my makeNewPath(i)
                    open i
                    save active presentation in pdfPath as save as PDF -- save in same folder
                    set end of theOutput to pdfPath as alias
                end if
            end repeat
        end tell
        tell application "Microsoft PowerPoint" -- work on version 15.15 or newer
            quit
        end tell
        return theOutput
    end run

    on makeNewPath(f)
        set t to f as string
        if t ends with ".pptx" then
            return (text 1 thru -5 of t) & "pdf"
        else
            return (text 1 thru -4 of t) & "pdf"
        end if
    end makeNewPath
  ```
- Save as `Convert-ppt-to-pdf`.
- Now `ppt file -> mouse-right-click -> Quick Actions -> Convert to PDF`
- References: [github](https://github.com/jeongwhanchoi/convert-ppt-to-pdf)
