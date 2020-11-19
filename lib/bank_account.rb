class BankAccount

    attr_reader :name
    attr_accessor :balance, :status
   

    def initialize(name)
        @name = name
        balance = 1000
        @balance = balance
        status = 'open'
        @status = status
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
       "Your balance is $#{self.balance}."
    end

    def valid?
      @status == 'open' && @balance > 0
    end

    def close_account
        self.balance = 0
        self.status = 'closed'
    end


end
