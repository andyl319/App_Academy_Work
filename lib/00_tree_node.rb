class PolyTreeNode
  attr_accessor :children

  def initialize(value)
    @parent = nil
    @value = value
    @children = []

  end

  def parent
    @parent
  end


  def value
    @value
  end

  def parent=(mother)
    if @parent && @parent.children.include?(self)
      @parent.children.delete(self)
    end
    @parent = mother
    mother.children << self unless mother.nil?
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if @children.include?(child)
      child.parent = nil
    else
      raise "Node is not a child."
    end
  end

  def dfs(target_val)
    return self if @value == target_val
    @children.each do |child|
      child_result = child.dfs(target_val)
      return child_result if child_result 
    end
    nil
  end

end

if __FILE__ == $PROGRAM_NAME
  n = PolyTreeNode.new(1)
  n2 = PolyTreeNode.new(2)
  n2.parent = n
  p n
end
