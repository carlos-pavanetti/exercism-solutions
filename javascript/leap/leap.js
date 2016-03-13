var Leap = function(year) { this.year = year; }

Leap.prototype.isLeap = function () {
    if (this.isDivisibleBy(100))
        return this.isDivisibleBy(400)
    return this.isDivisibleBy(4);
};

Leap.prototype.isDivisibleBy = function(quotient) {
    return this.year % quotient == 0;
}

module.exports = Leap;
