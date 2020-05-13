class Kubepfm < Formula
  desc "A tool to query/inspect DynamoDB tables."
  homepage "https://github.com/flowerinthenight/lsdy"
  url "https://github.com/flowerinthenight/lsdy/archive/v0.0.1.tar.gz"
  sha256 "a4ef2289fb0bee0f7bf684aaa65688fd954f6d5b76e4733ee484c4356dd50773"

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
