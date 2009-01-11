require "rubygems"
require "spec" # Satisfies Autotest and anyone else not using the Rake tasks
require "couchrest"

require File.expand_path(File.dirname(__FILE__)) + '/../lib/couchapp'

COUCHAPP = ARGV[0] || File.expand_path(File.dirname(__FILE__)) + '/../bin/couchapp'
SCRATCH_PATH = File.dirname(__FILE__) + '/scratch'
COUCHHOST = "http://127.0.0.1:5984"
TESTDB = 'couchapp-test'

def reset_test_db!
  cr = CouchRest.new(COUCHHOST)
  db = cr.database(TESTDB)
  db.delete! rescue nil
  db = cr.create_db(TESTDB) rescue nin
  db
end