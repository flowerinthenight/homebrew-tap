class Athena2csv < Formula
  desc "Query AWS Athena and download the result as CSV."
  homepage "https://github.com/flowerinthenight/athena2csv"
  url "https://github.com/flowerinthenight/athena2csv/archive/v0.0.2.tar.gz"
  sha256 "529f66f2dfcaed393938990e9a7cc73e230ca11ff473ad5e47dc04a135a6ddfa"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/flowerinthenight/athena2csv").install buildpath.children
    cd "src/github.com/flowerinthenight/athena2csv" do
      system "go", "build", "-o", bin/"athena2csv", "."
    end
  end

  test do
    assert_match /execute athena query and download csv result/, shell_output("#{bin}/athena2csv -h", 0)
  end
end
