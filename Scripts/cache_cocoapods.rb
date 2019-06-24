require "digest"
require "yaml"


ORIGINAL_SPEC_REPO_DIR = `echo $HOME/.cocoapods/repos/master/Specs`.strip()
PARTIAL_SPEC_REPO_DIR = "Specs"


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
  pods = get_pods()
  pods.each do |pod|
    original_path = get_original_path(pod)
    partial_path = get_partial_path(pod)
    puts "Copy #{original_path} -> #{partial_path}"
    `mkdir -p #{partial_path} && cp -R #{original_path} #{partial_path}/../`
  end
end


def restore()
  pods = get_pods()
  pods.each do |pod|
    original_path = get_original_path(pod)
    partial_path = get_partial_path(pod)
    puts "Copy #{partial_path} -> #{original_path}"
    `mkdir -p #{original_path} && cp -R #{partial_path} #{original_path}/../`
  end
end


def help()
  puts "Usage: ruby cache_cocoapods.rb [save|restore]"
end


def get_pods()
  lockfile = YAML.load(File.read("./Podfile.lock"))
  pods = lockfile["SPEC REPOS"]["https://github.com/cocoapods/specs.git"]
  return pods
end


def get_original_path(pod)
  return "#{ORIGINAL_SPEC_REPO_DIR}/#{get_shard_prefix(pod)}/#{pod}"
end


def get_partial_path(pod)
  return "#{PARTIAL_SPEC_REPO_DIR}/#{get_shard_prefix(pod)}/#{pod}"
end


def get_shard_prefix(pod)
  return Digest::MD5.hexdigest(pod)[0...3].split("").join("/")
end


main()
