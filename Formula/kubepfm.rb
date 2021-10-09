# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Kubepfm < Formula
  desc "Simple port-forward wrapper tool for multiple pods."
  homepage "https://github.com/flowerinthenight/kubepfm"
  version "1.5.6"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/flowerinthenight/kubepfm/releases/download/v1.5.6/kubepfm_1.5.6_darwin_amd64.tar.gz"
      sha256 "fde7178f206790f84ccf8fc1a9524ac1c56fe98868b99762d0ea49bcfb90cea6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/flowerinthenight/kubepfm/releases/download/v1.5.6/kubepfm_1.5.6_linux_amd64.tar.gz"
      sha256 "7c25a3a6ae1d9704efac9113a34fdb2e22a9da5406db8786ccb8713667dfcbc6"
    end
  end

  def install
    bin.install "kubepfm"
  end

  test do
    assert_match /Simple port-forward wrapper tool for multiple pods/, shell_output("#{bin}/kubepfm -h", 0)
  end
end
