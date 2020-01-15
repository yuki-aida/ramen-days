class ImageUploader < CarrierWave::Uploader::Base
  
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # アップロードファイルの保存先ディレクトリは上書き可能
  # 下記はデフォルトの保存先  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # アップロード可能な拡張子のリスト
  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end