# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubepfm < Formula
  desc "Simple port-forward wrapper tool for multiple pods."
  homepage "https://github.com/flowerinthenight/kubepfm"
  version "1.5.1"
  bottle :unneeded

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/flowerinthenight/kubepfm/releases/download/v1.5.1/kubepfm_1.5.1_darwin_amd64.tar.gz"
    sha256 "4c495b586633312273d8b81403424fad71bf3b0d5f73fbeaf774a8f476ad77fc"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/flowerinthenight/kubepfm/releases/download/v1.5.1/kubepfm_1.5.1_linux_amd64.tar.gz"
    sha256 "ad65e443d21090c63328f5bb0ece69fd433fd9c372a91a552c878fc1b4828ace"
  end

  def install
    bin.install "kubepfm"
  end

  test do
    assert_match /Simple port-forward wrapper tool for multiple pods/, shell_output("#{bin}/kubepfm -h", 0)
  end
end
