class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カジュアル' },
    { id: 3, name: 'セミフォーマル' },
    { id: 4, name: 'フォーマル' },
  ]
  end