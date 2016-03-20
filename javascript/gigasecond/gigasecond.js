var Gigasecond = function(date) {
    this.start_date = date;
}

Gigasecond.prototype.date = function() {
    return new Date(this.start_date.getTime() + 1e9 * 1e3);
}

module.exports = Gigasecond;
