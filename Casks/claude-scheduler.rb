cask "claude-scheduler" do
  version "0.2.0"
  sha256 "a4a6606b6662bc60d4e41aaa7ef6f25c50e2598e7f2a0a4038be2b4cde8d2c55"

  url "https://github.com/tornikegomareli/claude-scheduler/releases/download/v#{version}/ClaudeScheduler-#{version}.zip"
  name "Claude Scheduler"
  desc "Menu bar app that runs headless Claude Code tasks on a launchd schedule"
  homepage "https://github.com/tornikegomareli/claude-scheduler"

  depends_on macos: ">= :sonoma"

  app "ClaudeScheduler.app"

  # The app is ad-hoc signed (not notarized); clear quarantine so the
  # first launch isn't blocked by Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ClaudeScheduler.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/ClaudeScheduler",
  ]

  caveats <<~EOS
    Requires the Claude Code CLI (https://claude.com/claude-code).
    Scheduled tasks are registered as per-task LaunchAgents; removing a task
    from the app (or `claude-scheduler-runner remove`) cleans them up.
  EOS
end
