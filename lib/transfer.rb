class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  
  def initialize(sender, receiver, amount)
    status = "pending"
    @status = status
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? == true && @last_transaction != @amount && @sender.balance - @amount > 0
        @sender.balance -= @amount
        @receiver.balance += @amount
        @last_transaction = @amount
        self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

    def reverse_transfer
      if self.status == "complete"
        @sender.balance += @last_transaction
        @receiver.balance -= @last_transaction
        self.status = "reversed"
      end
    end

end
