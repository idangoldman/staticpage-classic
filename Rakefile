task "install" do
  exec("yarn install")
end

task "reinstall" do
  exec("rm -fr ./node_modules; yarn install")
end

task "dev" do
  exec("parcel source/index.njk")
end

task "build" do
  exec("parcel build source/index.njk")
end
