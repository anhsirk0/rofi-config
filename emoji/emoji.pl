#!/usr/bin/env perl

my $rofi_args = qq{-dmenu -i -p "Select emoji: "};
my $emoji_file = "$ENV{HOME}/.config/rofi/emoji/emojis.txt";

chomp(my $chosen = `cat "$emoji_file" | rofi $rofi_args`);

unless ($chosen) { exit };

my $emoji = (split "\t", $chosen)[0];
print $emoji . "\n";
my $message = "$emoji 'copied to clipboard'";
system("printf $emoji | xsel --input --clipboard && notify-send $message");
