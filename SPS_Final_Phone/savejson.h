#ifndef SAVEJSON_H
#define SAVEJSON_H

#include <QFile>
#include <QJsonDocument>
#include <QJsonObject>
//#include <QJsonArray>

class SaveJson:public QObject
{
    Q_OBJECT
public:
    SaveJson();

    //读取json文档中的数据，将其保存到mjsonData中
    bool LoadJson();

    //修改mjsonData中的username，并将其保存到json文件中
    Q_INVOKABLE bool resetUserName(QString string);
    //修改mjsonData中的mail，并将其保存到json文件中
    Q_INVOKABLE bool resetMail(QString string);
    //修改mjsonData中的person_signature，并将其保存到json文件中
    Q_INVOKABLE bool resetPerson_signature(QString string);
    //将json数据保存到文件中
    Q_INVOKABLE bool saveJsonData();

signals:
    void dataChanged();

private:
//    QJsonArray mjsonData;
    QString filepath;
    QJsonDocument mjsonData;
    QJsonObject obj;
};

#endif // SAVEJSON_H

