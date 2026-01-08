class User
    attr_reader :username, :pin
    attr_accessor :balance
    def initialize(username, pin)
       raise "Invalid name" if username == nil || username.is_a?(Integer) || username.is_a?(Float)
       raise "Invalid pin" if pin == nil || pin.is_a?(String)
        
       @username = username 
       @pin = pin 
       @balance = 0
    end 
end 

class Bank
   def initialize
      @customers = []
   end
   
   def register_user(usr)
     @customers << usr
     return "Registration Succesfull"
   end 
  
   def withdraw(money, user)
       get_money(money, user)
   end 

   def deposit(money, user)
     store_money(money, user)
   end 

   private 

   def get_money(money, user)
     user = @customers.find {|usr| usr.username == user}
     if (user == nil)
       puts "User does not exist"
     else 
       if (money > user.balance)
         raise "You dont have enough funds"
       elsif (money <= 0 || money.is_a?(String))
         raise "You cant withraw such value"
       elsif (money.is_a?(String))
         raise "String is not permitted to use here"
       else
         user.balance -= money
         puts "You succesfully withrawed: $#{money}"
         puts "Current Balance: $#{user.balance}" 
       end
     end  
   end 

   def store_money(money, user)
     user = @customers.find {|usr| usr.username == user}
     if (user == nil)
       puts "User does not exist"
     else 
        if (money <= 0)
           raise "You cannot deposit such value"
        elsif (money.is_a?(String))
           raise "String is prohibited here"
        else
          user.balance += money
          puts "You succesfully deposited $#{money}"
          puts "Current balance $#{user.balance}"
        end
     end
   end 
end 

#usage
Redbank = Bank.new

tyler = User.new("TylerABC", 4325)
cris = User.new("crisXYZ", 2026)

Redbank.register_user(tyler)
Redbank.register_user(cris)

Redbank.deposit(300, "TylerABC")