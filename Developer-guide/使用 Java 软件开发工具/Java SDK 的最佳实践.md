# Java SDK 的最佳实践

*Api* 实例应该在使用完后关闭以释放资源。

          
    Api api = new Api(URL, USER, PASSWORD);

    try {
     api.getDataCenters().add(new DataCenter());
     ...
    }

    finally {
     api.shutdown();
    }

        

