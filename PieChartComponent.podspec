Pod::Spec.new do |s|
  s.name         = 'PieChartComponent'
  s.version      = '1.0.0'
  s.summary      = 'Pie chart component for iOS with infinite scroll'
  s.author = {
    'Vitor Venturin' => '@vitorventurin'
  }
  s.homepage     = 'https://github.com/RobotsAndPencils/PieChartComponent'
  s.source = {
    :git => 'https://github.com/RobotsAndPencils/PieChartComponent.git',
    :tag => '1.0.0'
  }
  s.source_files = 'PieChartComponent/*.{h,m}'
  s.license      = 'MIT'
  s.platform     = :ios, '9.0'
  s.requires_arc = true
end