module Command
  class Instruction
    attr_accessor :commands

    def initialize commands = []
      @commands = commands
    end

    def run_command command
      command.execute
      commands << command
    end

    def undo_command
      commands.pop.unexecute
    end
  end

  class Amount
    attr_accessor :dollar, :euro

    def initialize
      @dollar = 500
      @euro = 300
    end
  end

  class DollarCommand
    def initialize amount
      @amount = amount
    end

    def execute
      @amount.dollar += 100
    end

    def unexecute
      @amount.dollar -= 100
    end
  end

  class EuroCommand
    def initialize amount
      @amount = amount
    end

    def execute
      @amount.euro += 200
    end

    def unexecute
      @amount.euro -= 200
    end
  end
end

instruction = Command::Instruction.new
amount = Command::Amount.new

instruction.run_command(Command::DollarCommand.new(amount))
puts amount.dollar

puts instruction.undo_command

instruction.run_command(Command::EuroCommand.new(amount))
puts amount.euro

puts instruction.undo_command
