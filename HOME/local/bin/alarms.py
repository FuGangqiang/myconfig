#!/usr/bin/python

import datetime
from pathlib import Path
import gi
gi.require_version('Notify', '0.7')
from gi.repository import Notify


class Alarm:
    def warn(self, title, msg):
        Notify.init(self.__class__.__name__)
        self.send_msg(title, msg)
        if msg == '关机':
            self.send_msg(title, msg+'!')
            self.send_msg(title, msg+'!!')
            self.send_msg(title, msg+'!!!')

    def send_msg(self, title, message, icon='dialog-warning', urgency=Notify.Urgency.CRITICAL):
        msg = Notify.Notification.new(title, message, icon)
        msg.set_urgency(urgency)
        msg.show()

    def check(self):
        pass


class BatteryAlarm(Alarm):
    def get_battery_capacity(self):
        capacity = Path('/sys/class/power_supply/BAT0/capacity').read_text()
        return int(capacity or 0)

    def check(self):
        capacity = self.get_battery_capacity()
        if capacity > 30:
            return
        self.warn('电量警报', f'电池电量只剩下 {capacity}%')


class ClockAlarm(Alarm):
    '''
    clocks file format:
    HH:MM:SS message
    '''
    def is_nearby_time(self, hm):
        h, m, *_ = hm.split(':')
        clock_second = int(h) * 3600 + int(m) * 60
        now = datetime.datetime.now()
        now_second = now.hour * 3600 + now.minute * 60
        check_second = (now_second - clock_second) % (24 * 3600)
        return check_second < 10 * 60 or check_second > 24 * 3600 - 10 * 60

    def get_nearby_clocks(self):
        fp = Path('~/.config/clocks').expanduser()
        if not fp.exists():
            return
        content = fp.read_text()
        for line in content.split('\n'):
            if not line:
                continue
            hm, message = line.split(maxsplit=1)
            if not self.is_nearby_time(hm):
                continue
            yield hm, message

    def check(self):
        for title, msg in self.get_nearby_clocks():
            self.warn(title, msg)


if __name__ == '__main__':
    alarms = [BatteryAlarm(), ClockAlarm()]
    for item in alarms:
        item.check()
