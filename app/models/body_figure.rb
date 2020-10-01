class BodyFigure < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '細身' },
    { id: 3, name: 'やや細身' },
    { id: 4, name: '普通' },
    { id: 5, name: 'やや太め' },
    { id: 6, name: '太め' },
    { id: 7, name: '筋肉質' },
  ]
  end