#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'Wardrobe';
all_from 'lib/Wardrobe.pm';

requires 'Catalyst::Runtime' => '5.80014';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'parent';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
                 
requires 'Catalyst::View::TT';
requires 'Catalyst::Plugin::Unicode';

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
