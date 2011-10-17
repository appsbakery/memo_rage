## Usage

    require "memo_rage"
    client = MemoRage::Client.new(:key => "abcd1234")
    client.search("fringe")
    => [#<MemoRage::Show:0x00000002dcdf00 @id=18388, @name="Fringe">, #<MemoRage::Show:0x00000002daef10 @id=9108, @name="Before The Fringe">]
    