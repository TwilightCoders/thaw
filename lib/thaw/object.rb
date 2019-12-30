class Object
  def thaw
    Fiddle::Pointer.new(object_id * 2)[1] &= ~(1 << 3)
    self
  end

  def thawed?
    !frozen?
  end
end
