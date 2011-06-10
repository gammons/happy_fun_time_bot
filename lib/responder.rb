class Responder
  attr_accessor :command, :block

  def initialize(command, &block)
    @command = command
    @block = block
  end

  def responds_to?(command)
    @command == command.split.first
  end
end
