#!/usr/bin/env bats

source "${BATS_TEST_DIRNAME}/test_helper.sh"

@test "It should install PostgreSQL 9.4.26" {
  /usr/lib/postgresql/9.4/bin/postgres --version | grep "9.4.26"
}

@test "It should support tds_fdw" {
  initialize_and_start_pg
  sudo -u postgres psql --command "CREATE EXTENSION tds_fdw;"
}

@test "It should support pg_proctab" {
  initialize_and_start_pg
  sudo -u postgres psql --command "CREATE EXTENSION pg_proctab;"
}

@test "The libpq version should be pinned for for pg_repack" {
  dpkg-query -l libpq-dev | grep -F "11."
  dpkg-query -l libpq5 | grep -F "11."
}
