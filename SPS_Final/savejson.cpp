#include "savejson.h"
#include <iostream>
#include <QDebug>
#include <QJsonObject>

SaveJson::SaveJson()
{
    filepath="./qml/data/user.json";
//    filepath="/root/Demo_10/qml/data/user.json";
    if(LoadJson()){
        qDebug()<<"解析成功";
    }else{
        qDebug()<<"解析失败";
    }
}

bool SaveJson::LoadJson()
{

    //判断路径以及是否正常打开
    if(filepath.isEmpty()){
        qDebug()<<"路径为空";
        return false;
    }

    QFile file(filepath);
    if(!file.open(QIODevice::ReadOnly)){
        qDebug()<<"打开文件失败\n";
        return false;
    }

    //读取数据后关闭文件
    const QByteArray raw_data=file.readAll();
    file.close();

    //解析为Json文档
    QJsonParseError json_error;
    mjsonData=QJsonDocument::fromJson(raw_data,&json_error);

    qDebug()<<"LoadJson的错误信息："<<json_error.errorString();
    if(mjsonData.isNull()){
        qDebug()<<"jsondoucument赋值失败\n";
        return false;
    }

    //是否正常解析Json数据
    if(json_error.error!=QJsonParseError::NoError){
        qDebug()<<"解析JSON数据失败\n";
        return false;
    }
    if(mjsonData.isEmpty()){
        qDebug()<<"jsondocument的数据为空\n";
    }

    return true;
}

bool SaveJson::resetUserName(QString string)
{
    //获取最外层这个大对象
    obj=mjsonData.object();
    //打印username的值
    qDebug()<<"username本来的值："<<obj["username"].toString();
    //修改username的值为string
    int x=obj["username"].toString().length();
    int y=string.length();
    int z=x-y;
    if(z>0){
        for(int i=0;i<z;i++){
            string+=" ";
        }
    }
    obj["username"]="";
    obj["username"]=string;

    mjsonData.setObject(obj);

    saveJsonData();
    return true;
}

bool SaveJson::resetMail(QString string)
{
    //获取最外层这个大对象
    obj=mjsonData.object();
    //打印mail的值
    qDebug()<<obj["mail"].toString();
    //修改mail的值为string
    obj["mail"]=string;
    qDebug()<<obj["mail"].toString();

    mjsonData.setObject(obj);

    saveJsonData();
    return true;
}

bool SaveJson::resetPerson_signature(QString string)
{
    //获取最外层这个大对象
    obj=mjsonData.object();
    //打印person_signature的值
    qDebug()<<obj["personal_signature"].toString();
    //修改person_signature的值为string
    obj["personal_signature"]=string;
    qDebug()<<obj["personal_signature"].toString();

    mjsonData.setObject(obj);

    saveJsonData();
    return true;
}

bool SaveJson::saveJsonData()
{
    QFile file(filepath);
    if(!file.open(QIODevice::ReadWrite)){
        qDebug()<<"打开文件失败\n";
        return false;
    }
    const QByteArray data=mjsonData.toJson();
    if(file.write(data)==-1){
        qDebug()<<"write to the file failed";
    }

    emit dataChanged();
    return true;
}


