class Transfer
  attr_accessor :sender, :receiver, :amount, :status
 
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver 
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid? 
      true
    else 
      false
    end 
  end 

  def execute_transaction
      if @sender.balance >= @amount && @sender.valid? && @receiver.valid? && self.status == 'pending'
        @receiver.balance += @amount 
        @sender.balance -= @amount
        self.status = "complete"

      else  
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
  end

  def reverse_transfer
    if execute_transaction
      @sender.balance += @amount 
      @receiver.balance -= @amount 
      self.status = "reversed"
    end 
  end 

end
