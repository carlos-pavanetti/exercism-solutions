from datetime import timedelta

def add_gigasecond(datetime):
    return datetime + timedelta(seconds = 10 ** 9)
