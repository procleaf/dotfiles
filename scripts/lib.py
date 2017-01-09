#! /usr/bin/env python

# ------------------------------------------------------------------------------
#
# A common Python library.
#
# TODO: still quite empty.
#
# 01/04/17
#
# yqm_leaf@163.com
#
# ------------------------------------------------------------------------------

import re

def valid_ipv4(ip):
    p     = r'^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$'
    res = re.search(p, ip)
    if not res: return False
    patterns = res.groups()
    for pattern in patterns:
        if not (0 <= int(pattern) <= 255):
            return False

    return True
