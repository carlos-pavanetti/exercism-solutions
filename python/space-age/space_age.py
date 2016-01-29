class SpaceAge(object):
    def __init__(self, seconds):
        self.seconds = seconds

YEARS_SECONDS = {
    'mercury': 31557600 * 0.2408467,
    'venus':   31557600 * 0.6151972,
    'earth':   31557600,
    'mars':    31557600 * 1.8808158,
    'jupiter': 31557600 * 11.862615,
    'saturn':  31557600 * 29.447498,
    'uranus':  31557600 * 84.016846,
    'neptune': 31557600 * 164.79132,
}

for planet, year_seconds in YEARS_SECONDS.items():
    def make_method(year_seconds=year_seconds):
        def on_planet(self):
            return round(self.seconds / year_seconds, 2)
        return on_planet

    setattr(SpaceAge, 'on_' + planet, make_method())

# http://docs.python-guide.org/en/latest/writing/gotchas/#late-binding-closures
