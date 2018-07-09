require 'rails_helper'

RSpec.describe SubtitleService::Parser do
  context '#perform' do
    let(:subtitle_path) { file_fixture('friends-season-1-1-eng.vtt') }

    it 'parses a subttile to an array of texts' do
      arr = SubtitleService::Parser.perform(subtitle_path.to_s)

      expect(arr).to be_a_kind_of(Array)
      expect(arr.size).to eq 10
      expect(arr[0]).to include "There's nothing to tell."
      expect(arr[0]).to include "It's just some guy I work with."
    end
  end
end
