# 关于

此仓库包含2个用于在Linux环境下快速安装Debian或RedHat的Ansible playbook，基于`ansible-provisioning`的示例程序修改而来。

# 工作原理

指定内核和initrd文件启动虚拟机，从网络上抓取响应文件和软件包，启动自动化安装进程。

# 运行环境

运行此playbook需要具有如下环境：

- Linux，安装libvirt，用于运行虚拟机
- ansible
- http服务器, 用于存放应答文件，软件仓库等。
- apt-cacher-ng, 用于deb下载的代理（可选）

我使用一台Debian Linux服务器安装了以上组件。

# 使用

1. 克隆本仓库软件`git clone https://github.com/liangguo/mylinuxprovisioner.git`
2. 初始化submodule, `git submodule init`
3. 根据实际情况修改playbook及template中的环境变量
4. 修改`hosts`文件, 此文件包含要新建的主机名和ip地址，可同时创建多个虚拟机
5. 运行`ansible-playbook debian-on-libvirt.yml`创建虚拟机

# TODO

支持pxe引导，用于其他虚拟化平台，或物理机