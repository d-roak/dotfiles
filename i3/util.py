import re
import logging
import subprocess as proc

def parse_workspace_name(name):
    return re.match('(?P<num>\d+):?(?P<shortname>\w+)? ?(?P<icons>.+)?', name).groupdict()


def construct_workspace_name(parts):
    new_name = str(parts['num'])
    if parts['shortname'] or parts['icons']:
        new_name += ':'

        if parts['shortname']:
            new_name += parts['shortname']

        if parts['icons']:
            new_name += ' ' + parts['icons']

    return new_name


def xprop(win_id, property):
    try:
        prop = proc.check_output(
            ['xprop', '-id', str(win_id), property], stderr=proc.DEVNULL)
        prop = prop.decode('utf-8')
        return re.findall('"([^"]+)"', prop)
    except proc.CalledProcessError as e:
        logging.warn("Unable to get property for window '%d'" % win_id)
        return None

