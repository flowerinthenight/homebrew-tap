class Lsdy < Formula
  desc "A tool to query/inspect DynamoDB tables."
  homepage "https://github.com/flowerinthenight/lsdy"
  url "https://github.com/flowerinthenight/lsdy/archive/v1.0.0.tar.gz"
  sha256 "ad0f249f1672d519112b4aa0063d2fc0179932b71b1256b5989371ea273c1691"

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
