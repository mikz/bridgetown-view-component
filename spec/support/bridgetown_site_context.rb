# frozen_string_literal: true

RSpec.shared_context "bridgetown built site" do
  def bridgetown_config_overrides
    {}
  end

  def bridgetown_site_metadata
    {
      "name" => "My Awesome Site",
      "author" => { "name" => "Ada Lovejoy" },
    }
  end

  before(:context) do
    @destination_dir = Dir.mktmpdir("bridgetown-vc-dest")

    metadata = bridgetown_site_metadata.to_yaml.sub("---\n", "")
    File.write(source_dir("_data/site_metadata.yml"), metadata)

    @config = Bridgetown.configuration(Bridgetown::Utils.deep_merge_hashes({
      "full_rebuild" => true,
      "root_dir"     => root_dir,
      "source"       => source_dir,
      "destination"  => @destination_dir,
    }, bridgetown_config_overrides)).tap do |conf|
      conf.run_initializers! context: :static
    end

    @site = Bridgetown::Site.new(@config)
    @site.process
  end

  after(:context) do
    FileUtils.rm_f(source_dir("_data/site_metadata.yml"))
    FileUtils.remove_entry(@destination_dir) if @destination_dir && File.exist?(@destination_dir)

    @destination_dir = @config = @site = nil
  end

  def destination_dir = @destination_dir
  def config = @config
  def site = @site

  def read_output(relative_path)
    File.read(File.join(destination_dir, relative_path))
  end
end

