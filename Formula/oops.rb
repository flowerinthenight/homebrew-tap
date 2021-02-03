# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Oops < Formula
  desc "Kubernetes-native testing tool."
  homepage "https://github.com/flowerinthenight/oops"
  version "1.1.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/flowerinthenight/oops/releases/download/v1.1.0/oops_1.1.0_darwin_amd64.tar.gz"
    sha256 "4227654f0ab23f026e55368f6007b42a43fa996cf75d554ea627673c744cf211"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/flowerinthenight/oops/releases/download/v1.1.0/oops_1.1.0_linux_amd64.tar.gz"
    sha256 "f80c1ea21cf7c78f08af2f57f73f52c8e337cd4e80a1f8c6bacaa6a5709ca8fd"
  end

  def install
    bin.install "oops"
  end

  test do
    assert_match /Kubernetes-native testing tool/, shell_output("#{bin}/oops -h", 0)
  end
end
