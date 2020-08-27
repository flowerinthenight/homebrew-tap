# This file was generated by GoReleaser. DO NOT EDIT.
class Dysync < Formula
  desc "Sync DynamoDB table across two AWS accounts."
  homepage "https://github.com/flowerinthenight/dysync"
  version "1.0.5"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/flowerinthenight/dysync/releases/download/v1.0.5/dysync_1.0.5_darwin_amd64.tar.gz"
    sha256 "e78d1f7eefce44674449b84557650e7812c5dac9a0b76bdaa3c968d9a8af599d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/flowerinthenight/dysync/releases/download/v1.0.5/dysync_1.0.5_linux_amd64.tar.gz"
      sha256 "1667813e04bfbb4349ec9df06725011f78fc299badd0d4ab24019fc213b3bf16"
    end
  end

  def install
    bin.install "dysync"
  end

  test do
    assert_match /Sync DynamoDB table across two AWS accounts/, shell_output("#{bin}/dysync -h", 0)
  end
end
