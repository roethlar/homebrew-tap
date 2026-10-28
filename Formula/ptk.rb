class Ptk < Formula
  desc "Warm PowerShell MCP sessions with compact, recoverable output"
  homepage "https://github.com/AlsoBeltrix/PowerShell-Token-Killer"
  license "Apache-2.0"

  depends_on "rtk"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.6/ptk-0.3.0-rc.6-osx-arm64.tar.gz"
      sha256 "16b7e57961dbc0bf91c6f44ab7168030a92ca65ef262d25b232abf784f2d3013"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.6/ptk-0.3.0-rc.6-linux-arm64.tar.gz"
      sha256 "323acbf528f351e33454f3552582315c5599f046f3f3c8e6edcf5f3669111c4c"
    end
    on_intel do
      url "https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.6/ptk-0.3.0-rc.6-linux-x64.tar.gz"
      sha256 "1cb4615f1ca45450daa56b1c7ba40a5e9d99e60331f887887368aaa38b750f48"
    end
  end

  # This release includes native signed executables and embedded runtime
  # libraries. Repackaging a bottle is unnecessary and can alter signatures.
  def install
    libexec.install Dir["*"]
    (libexec/"PACKAGE-HOME").write("#{opt_libexec}\n")
    bin.install_symlink libexec/"bin/ptk"
  end

  def caveats
    <<~EOS
      Register selected harnesses as your ordinary user:
        ptk init --agent codex
      Inspect the package and dependency with ptk doctor.
      Close PTK sessions using this package before upgrading or removing it.
      Remove harness integration with ptk uninstall --agent codex before uninstalling.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ptk version")
    assert_match "RTK:", shell_output("#{bin}/ptk doctor")
    assert_match "Choose --agent", shell_output("#{bin}/ptk init 2>&1", 64)
  end
end
