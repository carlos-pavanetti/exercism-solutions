local diff = require('difference-of-squares')

describe('Difference of squares', function()

  describe('square_of_sums', function()

    it('should square the sum of the numbers up to the given number', function()
      assert.equal(225, diff.square_of_sums(5))
      assert.equal(3025, diff.square_of_sums(10))
      assert.equal(25502500, diff.square_of_sums(100))
    end)

  end)

  describe('sum_of_squares', function()

    it('should sum the squares of the numbers up to the given number', function()
      assert.equal(55, diff.sum_of_squares(5))
      assert.equal(385, diff.sum_of_squares(10))
      assert.equal(338350, diff.sum_of_squares(100))
    end)

  end)

  describe('difference_of_squares', function()

    it('should subtract sum of squares from square of sums', function()
      assert.equal(0, diff.difference_of_squares(0))
      assert.equal(170, diff.difference_of_squares(5))
      assert.equal(2640, diff.difference_of_squares(10))
      assert.equal(25164150, diff.difference_of_squares(100))
    end)

  end)

end)
