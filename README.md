# CSP-solver
Cutting stock problem solver

## Setup
CSP solver source code is in `source` folder. There is Visual Studio solution consisting of:
- SolverDaemon, a C# console application 

SolverDaemon polls a database for pending tasks and solves them. It intended to run in background. Daemon is designed for working Postgres 11 database through EntityFramework. For database layout consult `installation/dbo.sql`. Majority of Entity Framework functionality should be covered by NuGet but some editing feature might need need Npgsql PostgreSQL Integration extension. In case of installation issues consult following links:
- [Could not load System.Memory.dll](https://github.com/npgsql/npgsql/issues/2415)
- [How to setup PostgreSQL with Visual Studio 2017](https://stackoverflow.com/questions/53701136/how-to-setup-postgresql-with-visual-studio-2017-or-net-4-5)
- [How to change data source to PostgreSQL](https://stackoverflow.com/questions/31870763/how-to-change-data-source-to-postgresql-in-entity-data-model-wizard-in-vs2010-pr)