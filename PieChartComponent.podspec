Pod::Spec.new do |s|
  s.name         = 'PieChartComponent'
  s.version      = '1.0.0'
  s.summary      = 'Pie chart component for iOS with infinite scroll'
  s.author = {
    'Vitor Venturin' => '@vitorventurin'
  }
  s.homepage     = 'https://robotsandpencils.com'
  s.source       = { :git => "git@github.com:RobotsAndPencils/PieChartComponent.git", :tag => s.version.to_s }
  s.source_files = 'PieChartComponent/*.{h,m}'
  s.license      = {
    :type => 'MIT',
    :text => <<-LICENSE
            Copyright (c) 2014 Vitor Venturin. All rights reserved.
    LICENSE
  }
  s.platform     = :ios, '9.0'
  s.requires_arc = true
end