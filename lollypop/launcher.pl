#!/usr/bin/perl -w

my $db = "$ENV{HOME}/.local/share/lollypop/lollypop.db";
my $rofi_config = "$ENV{HOME}/.config/rofi/lollypop/config.rasi";
my $query = q{select tracks.id, tracks.name, artists.name from tracks
              join track_artists on track_artists.track_id = tracks.id
              join artists on track_artists.artist_id = artists.id
              order by popularity desc;};

# get current playing song and artist
sub get_song_and_artist {
    my ($song, $artist) = grep /title|artist/, split "\n", `pactl list`;
    s/.*?\"//, s/\(.*?\)|\"//g, s/\s+$//, chomp for $song, $artist;
    $artist =~ s/ & /, /;
    return ($song, $artist)
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

sub main {
    my @all = split "\n", `echo "$query" | sqlite3 $db`;

    # collect songs in @songs (no duplicates)
    my %seen = ();
    my @songs = grep { ! $seen{substr $_, 0, 3} ++ } @all;

    my @names = ("Play next");
    my %ids = (); # { "name" => id }

    # refactoring song names and populating @names and %ids
    foreach my $song (@songs) {
        # s/Ft.*\|/|/g, s/\(.*?\)//g, s/\|/+/, s/\|/ -  / for $song;
        s/\|/+/, s/\|/ -  / for $song;
        my @temp = split('\+', $song);
        $ids{$temp[1]} = $temp[0];
        push(@names, $temp[1]);
    }

    my $total = scalar %ids;

    # update rofi placeholder
    my ($song, $artist) = get_song_and_artist();
    my $placeholder = "\t" x 2 . "  $song - $artist";
    update_rofi_placeholder($placeholder);

    my $joined_names = join "\n", @names;
    my $rofi_args = "-p 'Add song to Queue ($total):' -i -config $rofi_config";
    chomp(my $var = `echo "$joined_names" | rofi -dmenu $rofi_args`);

    # restore rofi placeholder , this is optional
    $placeholder = "";
    update_rofi_placeholder($placeholder);

    unless ($var) { exit }
    if($var eq "Play next") {
        system('notify-send "Next"; lollypop -n');
    } else {
        my ($song, $artist) = split "-", $var;
        system(qq{notify-send "=> $song" "$artist"; lollypop -m $ids{$var}});
    }
}

main()
