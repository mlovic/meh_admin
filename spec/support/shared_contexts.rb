# CV
Rspec.shared_context "Freeze time", time_sensitive: true do
  before(:all) { Timecop.freeze(base_time) }
  after(:all)  { Timecop.return }
end
