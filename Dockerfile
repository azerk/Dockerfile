FROM golang:1.9.2

MAINTAINER kzz

RUN mkdir  /usr/local/gopath
ADD myproject.tar.gz /usr/local/gopath/
# 安装beego程序包和bee工具。beego程序包将在应用程序内部使用，bee工具将用于在开发过程中实时重载代码。
RUN go get github.com/astaxie/beego && go get github.com/beego/bee

ENV GOPATH /usr/local/gopath/myproject
#RUN echo "export GOPATH=/root/gopath" >> /root/.bashrc
#RUN source /root/.bashrc

# 通过开发计算机上容器的8080端口暴露该应用程序。最后一行，
EXPOSE 80

# 使用bee命令开始对我们的应用程序进行实时重载。
CMD ["bee", "run","myproject"]