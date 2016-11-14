require 'test_helper'

class CprReportTest < ActiveSupport::TestCase

  def setup
    @report = CprReport.create()
  end

  test "sanity check contract" do
    assert @report.valid?
  end
end
