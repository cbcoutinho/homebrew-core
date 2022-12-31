class Temporalite < Formula
  desc "Experimental distribution of Temporal that runs as a single process"
  homepage "https://github.com/temporalio/temporalite"
  url "https://github.com/temporalio/temporalite/archive/v0.3.0.tar.gz"
  sha256 "a4980cca9b265694dca97e696fbe9136b2bb4ceecfc44a43cfc7d1ac55a3009b"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/temporalite"
  end

  test do
    run_output = shell_output("#{bin}/temporalite --version")
    assert_match "temporalite version #{version}", run_output
  end
end
