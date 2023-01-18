#! /usr/bin/env perl
use File::Find;

my $dir = $ENV{HOME} . "/.config/rofi/";
my $colors_dir = $ENV{HOME} . "/.config/rofi/colors";
my $theme;
my @all_config_files;

sub wanted {
    my $name = $File::Find::name;
    my $file = (split "/", $name)[-1];
    if ($file =~ /^\./) { return } # ignore hidden files/dirs

    if (-f && $_ =~ /config.rasi$/) {
        push(@all_config_files, $name);
    }
}

sub update_file {
    my ($config) = @_;
    my $config_content = "";

    # read config file
    open(FH, '<' . $config) or die "Unable to open\n";
    while(<FH>) {
        if ($_ =~ /import.*colors/) {
            $config_content .= qq{\@import\t "colors/$theme.rasi"\n};
            next;
        }
        $config_content .= $_;
    }
    close(FH);

    # write config file
    open(FH, '>' . $config) or die "Unable to open\n";
    print FH $config_content;
    close(FH);
}

sub main {
    if (scalar @ARGV > 0) {
        my @all_themes = split "\n", `ls $colors_dir`;
        ($theme) = grep /$ARGV[0]/, @all_themes;
        unless ($theme) {
            print "No theme found for \'$ARGV[0]\'\n"; 
        }
    }

    unless($theme) {
        $theme = `ls $colors_dir | fzf`;
        chomp $theme;
    }

    if ($theme) {
        print "\'$theme\' rofi theme selected\n";
        $theme =~ s/.rasi//g;

        find( \&wanted, $dir);
        foreach my $f (@all_config_files) {
            update_file($f)
        }
    } else {
        print "No theme selected\n";
    }
}

main()
