import os
import subprocess
import re
import datetime


class Event:
    def __init__(self, title, diff, ongoing, time):
        self.title = title
        self.title_cut = self.title[:100].strip()
        self.diff = diff
        self.human_diff = ':'.join(str(self.diff).split(':')[:-1])
        self.ongoing = ongoing
        self.time = time

        if self.ongoing:
            self.human_str = f"{self.title_cut} {self.human_diff} left"
        else:
            self.human_str = f"{self.title_cut} in {self.human_diff}"

    def __repr__(self):
        return f"Event(title: {self.title}, diff: {self.diff}, ongoing: {self.ongoing}, time: {self.time})"


def get_events():
    datetime_format = '%d %b %Y %H:%M'
    now = datetime.datetime.now()

    cmd = "icalBuddy -n -nrd -npn -ea -ps '/🛂/' -nnr ' ' -b '' -ab '' -iep 'title,datetime' -uid eventsToday+1"
    output = subprocess.Popen(
        cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE).communicate()[0]
    lines = output.decode('utf-8').strip().split('\n')

    events = []
    if lines == ['']:
        return events

    for line in lines:
        splat = line.split('🛂')

        match = re.search("^(.*?) \((.*?)\)$", splat[0])

        title = match.group(1)

        uid = splat[-1].encode('utf-8')

        timerange = splat[-2].replace('at ', '')
        starttime, endtime = timerange.split(' - ')

        try:
            endtime = datetime.datetime.strptime(
                starttime[:-5] + endtime, datetime_format)
            starttime = datetime.datetime.strptime(starttime, datetime_format)
        except:
            continue

        ongoing = starttime <= now <= endtime
        if ongoing:
            diff = endtime-now
        else:
            diff = starttime-now

        time = ' '.join(timerange.split()[3:])

        events.append(Event(title, diff, ongoing, time))
    return events


def generate_main_text(events):
    next_event_text = ' > ' + \
        events[1].human_str if (len(events) > 1 and events[0].ongoing) else ''
    return events[0].human_str + next_event_text


def plugin_undraw():
    args = [
        '--set upcoming drawing=off',
    ]
    os.system('sketchybar -m ' + ' '.join(args))


def plugin_draw(main_text):
    args = [
        f'--set upcoming label="{main_text}"',
        '--set upcoming drawing=on',
    ]
    os.system('sketchybar -m ' + ' '.join(args))


if __name__ == '__main__':
    events = get_events()

    if len(events) == 0:
        plugin_undraw()
    else:
        main_text = generate_main_text(events)
        plugin_draw(main_text)
