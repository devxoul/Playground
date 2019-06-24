require "yaml"


SPEC_REPO_DIR = `echo $HOME/.cocoapods/repos/master/Specs`.strip()


def main()
  command = ARGV[0]
  case command
  when "save"
    save()

  when "restore"
    restore()

  else
    help()
  end
end


def save()
  spec_dirs = get_spec_dirs()
  spec_dirs.each do |spec_dir|
    local_dir = get_local_dir(spec_dir)
    `mkdir -p #{local_dir} && cp -R #{spec_dir} #{local_dir}/../`
    puts "Copy #{spec_dir} -> #{local_dir}"
  end
end


def restore()
  spec_dirs = get_spec_dirs()
  spec_dirs.each do |spec_dir|
    local_dir = get_local_dir(spec_dir)
    `mkdir -p #{spec_dir} && cp -R #{local_dir} #{spec_dir}`
    puts "Copy #{local_dir} -> #{spec_dir}"
  end
end


def help()
  puts "Usage: ruby cache_cocoapods.rb [save|restore]"
end


def get_spec_dirs()
  lockfile = YAML.load(File.read("./Podfile.lock"))
  pods = lockfile["SPEC REPOS"]["https://github.com/cocoapods/specs.git"]

  find_args = pods.map { |pod| "-name #{pod}" }.join(" -o ")
  spec_dirs = `find #{SPEC_REPO_DIR} #{find_args}`.strip().split("\n")

  return spec_dirs.map { |dir| dir.strip() }
end


def get_local_dir(spec_dir)
  base_dir = `echo #{SPEC_REPO_DIR}`.strip()
  shard_dir = spec_dir.split(base_dir)[1]  # /7/7/7/ReactorKit
  return "Specs#{shard_dir}"  # Specs/7/7/7/ReactorKit
end


main()
