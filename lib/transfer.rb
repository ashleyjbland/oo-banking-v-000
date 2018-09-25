class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.balance > 0 && @sender.status == "open" && @receiver.balance > 0 && @receiver.status == "open"
      true
    else
      false
    end
    @sender.valid?
    @receiver.valid?
  end

  def execute_transaction
    if valid? == false
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      "Transaction has already been completed."
    elsif @sender.valid? == true
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    end
  end




end
