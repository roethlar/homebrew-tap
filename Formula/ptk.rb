class Ptk < Formula
  desc "Warm PowerShell MCP sessions with compact, recoverable output"
  homepage "https://github.com/AlsoBeltrix/PowerShell-Token-Killer"
  license "Apache-2.0"

  depends_on "rtk"

  on_macos do
    depends_on arch: :arm64
    on_arm do
      url "https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.5/ptk-0.3.0-rc.5-osx-arm64.tar.gz"
      sha256 "3f45c04291bfff7d136b00de375544dcc924d31fc0f3d5bdffc3549ad9a3d882"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.5/ptk-0.3.0-rc.5-linux-arm64.tar.gz"
      sha256 "0788a36cf59345f2491ae014f367dcd07414d1af0a042ac1a573b5b1489b41e2"
    end
    on_intel do
      url "https://github.com/AlsoBeltrix/PowerShell-Token-Killer/releases/download/v0.3.0-rc.5/ptk-0.3.0-rc.5-linux-x64.tar.gz"
      sha256 "58aa1425e6f81e3240508f59f23b68bc5401b404cd30534752ccbc371bde5245"
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
