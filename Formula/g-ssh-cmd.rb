# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GSshCmd < Formula
  desc "A simple wrapper to [ssh -t cmd] for AutoScaling Groups."
  homepage "https://github.com/flowerinthenight/g-ssh-cmd"
  version "0.3.3"

  on_macos do
    url "https://github.com/flowerinthenight/g-ssh-cmd/releases/download/v0.3.3/g-ssh-cmd_0.3.3_darwin_amd64.tar.gz"
    sha256 "eab53e0ba02c32a7fb78fa18c864aa4d1ae7c78b47071c5479a23fc391062547"

    def install
      bin.install "g-ssh-cmd"
    end

    if Hardware::CPU.arm?
      def caveats
        <<~EOS
          The darwin_arm64 architecture is not supported for the GSshCmd
          formula at this time. The darwin_amd64 binary may work in compatibility
          mode, but it might not be fully supported.
        EOS
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/flowerinthenight/g-ssh-cmd/releases/download/v0.3.3/g-ssh-cmd_0.3.3_linux_amd64.tar.gz"
        sha256 "d14e3eb86c014aceae18eae3ae1b0268d85c19d8429ea22055e2efe3d91d8296"

        def install
          bin.install "g-ssh-cmd"
        end
      end
    end
  end

  test do
    assert_match /A simple wrapper to/, shell_output("#{bin}/g-ssh-cmd -h", 0)
  end
end
