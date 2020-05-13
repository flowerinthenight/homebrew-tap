class Lsdy < Formula
  desc "A tool to query/inspect DynamoDB tables."
  homepage "https://github.com/flowerinthenight/lsdy"
  url "https://github.com/flowerinthenight/lsdy/archive/v0.0.3.tar.gz"
  sha256 "8927a19d01693af7e371be5e92b555d77947727616f7ece7e0d2b8d259728130"

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
