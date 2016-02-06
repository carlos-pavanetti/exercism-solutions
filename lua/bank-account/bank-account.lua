local account    = {}
local account_mt = { __index = account }

account.new = function()
    return setmetatable({}, account_mt)
end

account.close = function(self)
    self.__closed = true
end

account.balance = function(self)
    return self.__deposited_cash or 0
end

account.deposit = function(self, amount)
    assert(amount > 0, 'Deposit should be a positive amount')
    assert(not self.__closed, 'Account closed')

    self.__deposited_cash = (self.__deposited_cash or 0) + amount
end

account.withdraw = function(self, amount)
    assert(amount > 0, 'Withdraw should be a positive amount')
    assert(not self.__closed, 'Account closed')
    assert(self.__deposited_cash > amount, 'Insufficiently account')

    self.__deposited_cash = (self.__deposited_cash or 0) - amount
end

return account
