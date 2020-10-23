class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?()
    (@sender.valid?) && (@receiver.valid?) ? true : false
  end
  
  def execute_transaction()
    if (@status == "pending") && (valid?())
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end
end
