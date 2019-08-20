#!/usr/bin/env python3

# Adapted from:
# https://github.com/WnndGws/dotfiles2.0/master/.config/i3/i3scripts

import i3ipc
import logging
import signal
import sys
import fontawesome as fa

from util import *


WINDOW_ICONS = {
    'cmus': '',
    'feh': '',
    'code': '',
    'chrome': '',
    'vivaldi-stable': '',
    'ranger': '',
    'vim': '',
    'youtube-viewer': '',
    'mpv': '',
    'centerim5': '',
    'newsboat': '',
    'rtv': '',
    'rainbowstream': '',
    'plex': '',
    'kodi': '',
    'steam': '',
    'pdf': '',
    'neomutt': '',
    'spotify': '',
    'keepassxc': '',
    'firefox': '',
    'scim': '',
    'aria2c': '',
    'libre': '',
    'discord': '',
    'screenshots': '',
    'thunderbird': '',
    'st': ''
}

DEFAULT_ICON = ''


def icon_for_window(window):
    classes = xprop(window.window, 'WM_CLASS')
    if classes != None and len(classes) > 0:
        for cls in classes:
            cls = cls.lower()
            for key, value in WINDOW_ICONS.items():
                if re.match(f'.*{key}.*', cls) is not None:
                    return WINDOW_ICONS[key]
    logging.info(
        'No icon available for window with classes: %s' % str(classes))
    return DEFAULT_ICON


def rename_workspaces(i3):
    ws_infos = i3.get_workspaces()
    prev_output = None
    n = 1
    i = 0
    for ws_index, workspace in enumerate(i3.get_tree().workspaces()):
        ws_info = ws_infos[ws_index]

        name_parts = parse_workspace_name(workspace.name)
        name_parts['icons'] = ' '.join(
            set([icon_for_window(w) for w in workspace.leaves()]))

        if ws_info.output != prev_output and prev_output != None:
            i += 10
            n = i + 1
        prev_output = ws_info.output

        name_parts['num'] = n

        n += 1

        new_name = construct_workspace_name(name_parts)
        if workspace.name == new_name:
            continue
        i3.command('rename workspace "%s" to "%s"' % (workspace.name,
                                                      new_name))


def on_exit(i3):
    for workspace in i3.get_tree().workspaces():
        name_parts = parse_workspace_name(workspace.name)
        name_parts['icons'] = None
        new_name = construct_workspace_name(name_parts)
        if workspace.name == new_name:
            continue
        i3.command('rename workspace "%s" to "%s"' % (workspace.name,
                                                      new_name))
    i3.main_quit()
    sys.exit(0)


if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)

    i3 = i3ipc.Connection()

    # Exit gracefully when ctrl+c is pressed
    for sig in [signal.SIGINT, signal.SIGTERM]:
        signal.signal(sig, lambda signal, frame: on_exit(i3))

    rename_workspaces(i3)

    def window_event_handler(i3, e):
        if e.change in ['new', 'close', 'move']:
            rename_workspaces(i3)

    i3.on('window', window_event_handler)
    i3.main()

