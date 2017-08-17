# encoding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  # include ::CarrierWave::Backgrounder::Delay

  storage :file

  def store_dir
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "uploads/word/#{model.class.to_s.underscore}/#{model.word_id}/#{model.id}"
  end

  def filename
    super.strip.gsub(/[^\w\.\-]/, '_').squeeze('_').downcase if original_filename.present?
  end

  def default_url(*args)
      ActionController::Base.helpers.asset_path([version_name, "default_no_image.png"].compact.join('_'))
  end

  def extension_white_list
    %w(jpg jpeg gif png bmp)
  end

  # process :auto_orient # http://makandracards.com/makandra/12323-carrierwave-auto-rotate-tagged-jpegs
  def auto_orient
    manipulate! do |image|
      image.tap(&:auto_orient)
    end
  end

  # process :convert => :png
  process :auto_orient

  version :block do
    process :convert => :png
    process :resize_to_fill => [200,200]
    def full_filename (for_file = model.image.file)
      super.chomp(File.extname(super)).strip.gsub(/[^\w\.\-]/, '_').squeeze('_').downcase + '.png'
    end
  end

  version :thumb, :from_version => :block do
    process :convert => :png
    process :resize_to_fill => [80,80]
    def full_filename (for_file = model.image.file)
      super.chomp(File.extname(super)).strip.gsub(/[^\w\.\-]/, '_').squeeze('_').downcase + '.png'
    end
  end

  version :palm do
    process :convert => :png
    process :auto_orient
    process :resize_to_fit => [400, 400]
    def full_filename (for_file = model.image.file)
      super.chomp(File.extname(super)).strip.gsub(/[^\w\.\-]/, '_').squeeze('_').downcase + '.png'
    end
  end

end
