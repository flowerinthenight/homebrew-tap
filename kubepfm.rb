class Kubepfm < Formula
  desc "A simple wrapper to kubectl port-forward for multiple pods."
  homepage "https://github.com/flowerinthenight/kubepfm"
  url "https://github.com/flowerinthenight/kubepfm/archive/v0.0.2.tar.gz"
  sha256 "3b1f680b821635600597afb5b72b3d3db6ac6af4ffca4afaab887bf68a050151"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GO111MODULE"] = "on"
    ENV["GOFLAGS"] = "-mod=vendor"
    bin_path = buildpath/"src/github.com/flowerinthenight/Kubepfm"
    bin_path.install Dir["*"]
    cd bin_path do
      system "go", "build", "-o", bin/"kubepfm", "."
    end
  end

  test do
    system "false"
    assert_match /Simple port-forward wrapper tool for multiple pods/, shell_output("#{bin}/kubepfm -h", 0)
  end
end
