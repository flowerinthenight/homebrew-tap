class Lsdy < Formula
  desc "A tool to query/inspect DynamoDB tables."
  homepage "https://github.com/flowerinthenight/lsdy"
  url "https://github.com/flowerinthenight/lsdy/archive/v1.4.0.tar.gz"
  sha256 "a80278cec66326e45c5475e7d04618fee05979936867474b6b737b2e1ab4472b"

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
