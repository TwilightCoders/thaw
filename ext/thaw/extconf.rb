require 'mkmf'

# Warning message
puts <<~WARNING
  ┌─────────────────────────────────────────────────────────────────────────────┐
  │ ⚠️  WARNING: Building DANGEROUS native extension for object unfreezing       │
  │                                                                             │
  │ This extension manipulates Ruby's internal object representation and        │
  │ may cause crashes, memory corruption, or undefined behavior.                │
  │                                                                             │
  │ Only use this if you absolutely understand the risks and have no other      │
  │ option. Consider using Object#dup instead.                                  │
  │                                                                             │
  │ This functionality is explicitly against Ruby's design principles.          │
  └─────────────────────────────────────────────────────────────────────────────┘

WARNING

puts "\n🚨 Building native extension..."
puts "This may cause segmentation faults on modern Ruby versions.\n\n"

# Platform-specific compiler setup
case RUBY_PLATFORM
when /darwin/
  # macOS specific
  $CFLAGS += " -D__APPLE__"
  # GCC/Clang flags for macOS
  $CFLAGS += " -Wno-error -Wno-deprecated-declarations -Wno-strict-prototypes -Wno-compound-token-split-by-macro -w"
when /linux/
  # Linux specific
  $CFLAGS += " -D__LINUX__"
  # GCC flags for Linux
  $CFLAGS += " -Wno-error -Wno-deprecated-declarations -Wno-strict-prototypes -w"
when /mingw|mswin/
  # Windows specific  
  $CFLAGS += " -D__WINDOWS__"
  # MinGW/MSYS2 flags for Windows (setup-ruby uses MinGW)
  if RUBY_PLATFORM =~ /mingw/
    $CFLAGS += " -Wno-error -Wno-deprecated-declarations -Wno-strict-prototypes -w"
  else
    # MSVC flags (if using Visual Studio)
    $CFLAGS += " /W0"  # Suppress all warnings for MSVC
  end
end

# Force correct 64-bit sizes for platforms where needed
if RUBY_PLATFORM =~ /darwin/
  $CFLAGS += " -DSIZEOF_LONG=8"
  $CFLAGS += " -DSIZEOF_VOIDP=8"
end

# Create the makefile
create_makefile('thaw/thaw_native')
