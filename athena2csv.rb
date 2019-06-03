class Athena2csv < Formula
  desc "Query AWS Athena and download the result as CSV."
  homepage "https://github.com/flowerinthenight/athena2csv"
  url "https://github.com/flowerinthenight/athena2csv/archive/v0.0.3.tar.gz"
  sha256 "a185fe5cec1e8c63627ecfb2aefce0cb4dc1ebe898c5456c14760fb573fa9d76"

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
    assert_match /Execute athena query and download csv result/, shell_output("#{bin}/athena2csv -h", 0)
  end
end
