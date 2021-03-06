use strict;
use warnings;
use Test::Requires 'DBD::SQLite';
use Test::More;
use t::Util;
use DBIx::QueryLog;

my $dbh = t::Util->new_dbh;

DBIx::QueryLog->skip_bind(1);

my $res = capture {
    $dbh->do('SELECT * FROM sqlite_master WHERE name = ?', undef, 'foo');
};

like $res, qr/SELECT \* FROM sqlite_master WHERE name = \? : \[foo\]/, 'SQL';

done_testing;
