Pod::Spec.new do |spec|
  spec.name = 'AutoLayoutHelperSwift'
  spec.version = '1.0.2'
  spec.license = 'MIT'
  spec.summary = 'UIView extension to easily create common Auto Layout Constraints for iOS.'
  spec.homepage = 'https://github.com/ustwo/autolayout-helper-swift'
  spec.authors = {
    'Shagun Madhikarmi' => 'shagun@ustwo.com',
    'Daniela Dias' => 'daniela@ustwo.com'
  }
  spec.source = {
    :git => 'https://github.com/ustwo/autolayout-helper-swift.git',
    :tag => 'v1.0.2'
  }
  spec.ios.deployment_target = '8.3'
  spec.source_files = 'Sources/*.swift'
  spec.requires_arc = true
end
