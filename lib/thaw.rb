require 'thaw/version'

module Thaw

  def self.load
    require 'thaw/thaw_native'
    # Native extension loaded successfully with its own warnings
    warn "thaw: ⚠️ Native C extension loaded. Proceed with extreme caution!"
  rescue LoadError
    load_error
  end

  private

  def self.load_error
    # Native extension not available - guide users to safer alternatives
    warn "ERROR: thaw native extension failed to compile."
    warn ""
    warn "⚠️  RECOMMENDED: Use Object#dup instead of trying to unfreeze objects:"
    warn "   frozen_obj.dup  # ✅ Safe way to get mutable copy"
    warn ""
    warn "If the extension failed to compile, you may need:"
    warn "   - A C compiler (gcc, clang, Visual Studio)"
    warn "   - Ruby development headers"
    warn ""
    warn "The Ruby/Fiddle fallback has been removed for safety on modern Ruby versions."
    
    # Exit without loading any dangerous functionality
    return
  end
end

Thaw.load
