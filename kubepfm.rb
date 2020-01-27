class Kubepfm < Formula
  desc "A simple wrapper to kubectl port-forward for multiple pods."
  homepage "https://github.com/flowerinthenight/kubepfm"
  url "https://github.com/flowerinthenight/kubepfm/archive/v0.1.0.tar.gz"
  sha256 "e3d8ec3436b8f77df88af11727abbe55c540eb64791cca0249f59f9580cdf78b"

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
