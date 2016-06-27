# -*- coding: utf-8 -*-

# This is an example module to be used as a template.
# See https://github.com/ultrabug/py3status/wiki/Write-your-own-modules
# for more details.
#
# NOTE: py3status will NOT execute:
#     - methods starting with '_'
#     - methods decorated by @property and @staticmethod
#
# NOTE: reserved method names:
#     - 'kill' method for py3status exit notification
#     - 'on_click' method for click events from i3bar (read below please)
#
# WARNING:
#
# Do NOT use print on your modules: py3status will catch any output and discard
# it silently because this would break your i3bar (see issue #20 for details).
# Make sure you catch any output from any external program you may call
# from your module. Any output from an external program cannot be caught and
# silenced by py3status and will break your i3bar so please, redirect any
# stdout/stderr to /dev/null for example (see issue #20 for details).
#
# CONTRIBUTORS:
#
# Contributors are kindly requested to agree to contribute their code under
# the BSD license to match py3status' one.
#
# Any contributor to this module should add his/her name to the @author
# line, comma separated.
#
# DOCSTRING:
#
# Fill in the following docstring: it will be parsed by py3status to document
# your module from the CLI.
"""
Displays power level for mouse

This is supposed to be a multi line description,
but I do not have much to say

Configuration parameters:
    - cache_timeout : how often we refresh this module in seconds

@author <Daniel Baird> <JamesDanielBaird@gmail.com>
@license BSD
"""

# import your useful libs here
from time import time
from subprocess import check_output
import re

class Py3status:

    # available configuration parameters
    cache_timeout = 10

    def __init__(self):
        """
        This is the class constructor which will be executed once.
        """
        pass

    def kill(self, i3s_output_list, i3s_config):
        """
        This method will be called upon py3status exit.
        """
        pass

    def on_click(self, i3s_output_list, i3s_config, event):
        pass

    def example_method(self, i3s_output_list, i3s_config):
        out = check_output(["sh", r"/home/dan/.scripts/mouse_power.sh"])
        percentage_search = re.search(r"[0-9][0-9]%", out)
        output = percentage_search.group(0)
        response = {
            'cached_until': time() + self.cache_timeout,
            'full_text': 'Mouse: ' + output
        }
        return response

if __name__ == "__main__":
    from time import sleep
    x = Py3status()
    config = {
        'color_bad': '#FF0000',
        'color_degraded': '#FFFF00',
        'color_good': '#00FF00'
    }
    while True:
        print(x.example_method([], config))
        sleep(1)
