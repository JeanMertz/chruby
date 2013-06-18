. ./share/chruby/auto.fish
. ./test/fish/helper.fish

set TEST_DIR "$PWD"
set PROJECT_DIR "$PWD/test/project"

function setup_tank
	chruby_reset
	set -eg RUBY_VERSION_FILE
end

function it_auto_loads_chruby_in_fish_shell
	return (fish -c 'functions -n | grep -c chruby_auto-1')
end

function it_only_loads_chruby_auto_function_once
	. ./share/chruby/auto.fish
	return (fish -c 'functions -n | grep -c chruby_auto-1')
end

function it_unsets_ruby_version_file
	set -g RUBY_VERSION_FILE 'dirty'
	. ./share/chruby/auto.fish
	test "$RUBY_VERSION_FILE" = ''
end

function it_switches_ruby_when_entering_versioned_directory
	cd "$PROJECT_DIR"; and chruby_auto >/dev/null
	test "$TEST_RUBY_ROOT" = "$RUBY_ROOT"
end

function it_switches_ruby_when_entering_subdir_of_versioned_directory_directly
	cd "$PROJECT_DIR/sub_dir"; and chruby_auto >/dev/null
	test "$TEST_RUBY_ROOT" = "$RUBY_ROOT"
end

function it_keeps_current_ruby_when_entering_subdir_of_versioned_directory
	cd "$PROJECT_DIR"; and chruby_auto >/dev/null
	cd sub_dir; and chruby_auto
	test "$TEST_RUBY_ROOT" = "$RUBY_ROOT"
end

function it_switches_ruby_when_leaving_versioned_directory
	cd "$PROJECT_DIR"; and chruby_auto >/dev/null
	cd sub_versioned/; and chruby_auto
	test "$RUBY_ROOT" = ''
end

function it_overrides_ruby_set_in_ruby_version_file
	cd "$PROJECT_DIR"; and chruby_auto >/dev/null
	chruby system; and chruby_auto
	test "$RUBY_ROOT" = ''
end

function it_resets_ruby_when_leaving_versioned_directory
	cd "$PROJECT_DIR"; and chruby_auto >/dev/null
	cd "$PROJECT_DIR/.."; and chruby_auto
	test "$RUBY_ROOT" = ''
end

function it_keeps_current_ruby_when_loading_unknown_version
	cd "$PROJECT_DIR"; chruby_auto >/dev/null
	cd bad/; chruby_auto 2>/dev/null
	test "$TEST_RUBY_ROOT" = "$RUBY_ROOT"
end

function clean_tank
  cd "$TEST_DIR"
end

. $fish_tank
