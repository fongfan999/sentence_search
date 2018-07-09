require 'webvtt'

class SubtitleService::Parser
  include Service

  def initialize(path)
    @path = path
  end

  def perform
    webvtt = WebVTT.read(@path)
    webvtt.cues.map(&:text)
  end
end
