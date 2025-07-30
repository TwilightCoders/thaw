/*
 * ⚠️ DANGEROUS CODE ⚠️
 * 
 * Simplified thaw extension that avoids problematic Ruby headers
 * This provides just enough functionality to test the extension loading path
 */

/* Use system Ruby headers */
#include <ruby.h>

/*
 * Actually unfreeze the object by clearing the frozen flag
 * WARNING: This is extremely dangerous and may crash Ruby!
 */
static VALUE
rb_obj_thaw(VALUE obj)
{
    rb_warn("thaw: Object unfreezing attempted - this is extremely dangerous!");
    rb_warn("thaw: Consider using Object#dup instead for safety");
    
    /* Actually unfreeze the object by clearing the FL_FREEZE flag */
    if (OBJ_FROZEN(obj)) {
        /* Clear the frozen flag directly in the object's flags */
        RBASIC(obj)->flags &= ~FL_FREEZE;
    }
    
    return obj;
}

/*
 * Check if an object is thawed (not frozen).
 */
static VALUE
rb_obj_thawed_p(VALUE obj)
{
    return OBJ_FROZEN(obj) ? Qfalse : Qtrue;
}

/*
 * Returns version information - simplified to avoid problematic constants
 */
static VALUE
rb_thaw_version_info(VALUE self)
{
    VALUE info = rb_hash_new();
    
    rb_hash_aset(info, ID2SYM(rb_intern("ruby_version")), rb_const_get(rb_cObject, rb_intern("RUBY_VERSION")));
    rb_hash_aset(info, ID2SYM(rb_intern("extension_version")), rb_str_new_cstr("2.0.0-dangerous"));
    rb_hash_aset(info, ID2SYM(rb_intern("safe")), Qfalse);
    rb_hash_aset(info, ID2SYM(rb_intern("warning")), 
                 rb_str_new_cstr("DANGEROUS extension loaded - actually unfreezes objects!"));
    
    return info;
}

/*
 * Initialize the thaw native extension.
 */
void
Init_thaw_native(void)
{
    /* Print simplified warning */
    fprintf(stderr, "\n");
    fprintf(stderr, "┌─────────────────────────────────────────────────────────────────────────────┐\n");
    fprintf(stderr, "│ ⚠️  DANGEROUS NATIVE EXTENSION LOADED                                        │\n");
    fprintf(stderr, "│                                                                             │\n");
    fprintf(stderr, "│ The thaw native extension is now active and may cause crashes.                │\n");
    fprintf(stderr, "│ This version ACTUALLY UNFREEZES OBJECTS - extremely dangerous!               │\n");
    fprintf(stderr, "│                                                                             │\n");
    fprintf(stderr, "│ USE AT YOUR OWN RISK - You have been warned!                                  │\n");
    fprintf(stderr, "└─────────────────────────────────────────────────────────────────────────────┘\n");
    fprintf(stderr, "\n");
    
    /* Add methods to Object class */
    rb_define_method(rb_cObject, "thaw", rb_obj_thaw, 0);
    rb_define_method(rb_cObject, "thawed?", rb_obj_thawed_p, 0);
    
    /* Add module-level info method */
    VALUE thaw_module = rb_define_module("ThawNative");
    rb_define_singleton_method(thaw_module, "version_info", rb_thaw_version_info, 0);
}
