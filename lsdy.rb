class Lsdy < Formula
  desc "A tool to query/inspect DynamoDB tables."
  homepage "https://github.com/flowerinthenight/lsdy"
  url "https://github.com/flowerinthenight/lsdy/archive/v1.1.0.tar.gz"
  sha256 "10f48898afdb468b38ff2545295874ba7d3deabad96f284c0af76c0455121de0"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/flowerinthenight/lsdy").install buildpath.children
    cd "src/github.com/flowerinthenight/lsdy" do
      system "go", "build", "-o", bin/"lsdy", "."
    end
  end

  test do
    assert_match /DynamoDB query tool/, shell_output("#{bin}/lsdy -h", 0)
  end
end
