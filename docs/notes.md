# rl754 suckless setting-up notes

Personal notes for my [suckless](https://github.com/multirepository/suckless) environment.
Here you can find some questionable solutions to my build that I decided not to integrate into the main repository, but I use them.

## Quick start
Write to `~/.xinitrc`
```sh
export QT_QPA_PLATFORMTHEME=qt5ct
setxkbmap us,ru -option grp:alt_shift_toggle

feh --bg-fill /path/to/background.png &
/usr/libexec/xfce-polkit &
dunst &
slstatus &

exec dbus-run-session dwm
```
or use [session files](xsessions)

Dependencies
`dbus-x11 dunst feh qt5ct qt6ct xfce-polkit`

## Screenshot
Add hotkeys in dwm:

/* commands */
```c
static const char *flameshotcmd[] = { "flameshot", "gui", NULL };
```
/* keys */
```c
{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = flameshotcmd } },
```

Dependencies
`flameshot`

## Volume control
Works with PulseAudio and PipeWire through the compatibility layer `pipewire-pulse`.

Add hotkeys in dwm:

/* commands */
```c
#include <X11/XF86keysym.h>
static const char *upvol[]   = { "pamixer", "-i", "5", NULL };
static const char *downvol[] = { "pamixer", "-d", "5", NULL };
static const char *mutevol[] = { "pamixer", "-t", NULL };
```
/* keys */
```c
{ 0,         XF86XK_AudioRaiseVolume,      spawn,          {.v = upvol   } },
{ 0,         XF86XK_AudioLowerVolume,      spawn,          {.v = downvol } },
{ 0,                XF86XK_AudioMute,      spawn,          {.v = mutevol } },
```

Add a block in slstatus:
```c
{ run_command, "// %s ", "pamixer --get-volume-human" },
```

Dependencies
`pamixer`

## Power
Use [powerdmenu](scripts/powerdmenu) for a convenient power menu.

## Xorg libinput config
If you want to turn off mouse acceleration.

Write to `/etc/X11/xorg.conf.d/40-libinput.conf`
```conf
Section "InputClass"
    Identifier "libinput pointer catchall"
    MatchIsPointer "on"
    MatchDevicePath "/dev/input/event*"
    Driver "libinput"
    Option "AccelProfile" "flat"
EndSection
```
