class Kubepfm < Formula
  desc "A simple wrapper to kubectl port-forward for multiple pods."
  homepage "https://github.com/flowerinthenight/kubepfm"
  url "https://github.com/flowerinthenight/kubepfm/archive/v1.0.0.tar.gz"
  sha256 "a4ef2289fb0bee0f7bf684aaa65688fd954f6d5b76e4733ee484c4356dd50773"

  depends_on "go"

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    ENV["PATH"] = "#{ENV["PATH"]}:#{buildpath}/bin"
    (buildpath/"src/github.com/flowerinthenight/kubepfm").install buildpath.children
    cd "src/github.com/flowerinthenight/kubepfm" do
      system "go", "build", "-o", bin/"kubepfm", "."
    end
  end

  test do
    assert_match /Simple port-forward wrapper tool for multiple pods/, shell_output("#{bin}/kubepfm -h", 0)
  end
end
