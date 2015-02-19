# Settings for psql command line client

Adding these lines to `~/.psqlrc` will affect the behavior of the command-line client `psql`.

Credits
 - @datachomp's [dbatoolbelt](https://github.com/datachomp/dbatoolbelt/blob/master/postgres/psqlrc)
 - config files inherited from @arowla

## Interactive settings

### Turn autocommit off

(only applies to commands run in client)

    \set AUTOCOMMIT off

### Ignore any commands after an error

(until rollback)

    \set ON_ERROR_ROLLBACK on

...after a command raises an error, this is what will be returned when you try to execute further commands. Once you `ROLLBACK`, behavior returns to normal.

    ERROR: current transaction is aborted, commands ignored until end of transaction block

### Always get the time it took to execute a command

    \timing

## History files

### Set number of lines (eg 2000) in history file

    \set HISTSIZE 2000

### Make separate history files for each host and database

    \set HISTFILE ~/.psql_history- :HOST - :DBNAME

## Prompt config 

all options [here](http://www.postgresql.org/docs/9.2/static/app-psql.html#APP-PSQL-PROMPTING)

### Change the prompt when in the middle of an uncommitted transaction 

    \set PROMPT1 '%/%R%x%#'

When in single-line mode (the default) the `%R` flag does a few things, based on your current state. If you're in the middle of a quoted string, it displays `'`

    datacommons=> select 'goo
    datacommons'> ';

If you're in the middle of an uncommitted string of commands (by default a transaction block if you've set `\set AUTOCOMMIT off` as above) it displays an `*`. Good for keeping track of what state you're in, and whether `COMMIT;` will commit just your current query or that query plus others before it.

    datacommons=> select 1;
     ?column? 
    ----------
            1
    (1 row)

    datacommons=*> rollback;
    ROLLBACK
    Time: 0.124 ms
    datacommons=> 

### Colorize prompt

example from @datachomp

    \set PROMPT1 '%[%033[33;1m%]%x%[%033[0m%]%[%033[1m%]%/%[%033[0m%]%R%# '

example from psql doc

    \set PROMPT1 '%[%033[1;33;40m%]%n@%/%R%[%033[0m%]%# '
