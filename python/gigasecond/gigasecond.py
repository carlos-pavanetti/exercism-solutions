from datetime import timedelta


def add_gigasecond(datetime):
    return datetime + timedelta(seconds=1e9)
