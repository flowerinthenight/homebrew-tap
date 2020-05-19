class Kubepfm < Formula
  desc "A simple wrapper to kubectl port-forward for multiple pods."
  homepage "https://github.com/flowerinthenight/kubepfm"
  url "https://github.com/flowerinthenight/kubepfm/archive/v1.1.0.tar.gz"
  sha256 "9182c47a05434be49f1959c557b86f969e829fb29c7e6a0b196a4bf8e9d3d498"

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
