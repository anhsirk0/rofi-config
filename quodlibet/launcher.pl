#!/usr/bin/perl -w

my $rofi_config = "$ENV{HOME}/.config/rofi/quodlibet/config.rasi";
my $songs_dir = "$ENV{HOME}/Music";

# run quodlibet queries
sub ql {
    my ($args, $notify) = @_;
    unless ($notify) {
        chomp(my $output = `quodlibet $args`);
        return $output;
    }
    system("quodlibet $args && notify-send $notify");
}

# get current playing song and artist
sub get_song_and_artist {
    # `quodlibet --print-playing is slow
    # my ($artist, $_album, $song) = split " - ", ql("--print-playing");

    my ($song, $artist) = grep(/title|artist/, split("\n", `pactl list`));
    s/.*?\"//, s/\(.*?\)|\"//g, s/\s+$//, chomp for $song, $artist;
    $artist =~ s/ & /, /;
    return ($song, $artist);
}

# add current song info to rofi menu placeholder
sub update_rofi_placeholder {
    my ($placeholder) = @_;

    # read config
    my $config_content = "";
    open(FH, '<', $rofi_config) or die "Unable to open\n";
    while(<FH>) {
        if ($_ =~ /place/) {
            $_ =~ s/\".*\"/\"$placeholder\"/;
        }
        $config_content .= $_;
    }
    close(FH);

    # write config
    open(FH, '>', $rofi_config) or die "Unable to open\n";
    print FH $config_content;
    close(FH);
}

sub to_uri {
    my ($name) = @_;
    my $uri = "file://" . $songs_dir . "/" . $name . ".mp3";
    $uri =~ s/ /%20/g;
    $uri = "'" . $uri . "'";
    return $uri;
}

sub main {
    my $ls_songs_dir = `ls $songs_dir | shuf`;
    $ls_songs_dir =~ s/.mp3//g;
    
    my @names = split("\n", $ls_songs_dir);
    my $total = scalar @names;

    # update rofi placeholder
    my ($song, $artist) = get_song_and_artist();
    my $placeholder = "\t" x 2 . "  $song - $artist";
    update_rofi_placeholder($placeholder);

    my $joined_names = "Play next\n" . $ls_songs_dir;
    my $rofi_args = "-p 'Add song to Queue ($total):' -i -config $rofi_config";
    chomp(my $chosen = `echo "$joined_names" | rofi -dmenu $rofi_args`);

    unless ($chosen) { exit }
    if($chosen eq "Play next") {
        ql("--next", '"Next"');
    } else {
        my ($song, $artist) = split " - ", $chosen;
        ql("--enqueue " . to_uri($chosen), qq{"=> $song" "$artist"});
    }

    # restore rofi placeholder , this is optional
    $placeholder = "";
    update_rofi_placeholder($placeholder);
}

main()
