#ifndef ELEMENTARRAY_H
#define ELEMENTARRAY_H
#include <QQuickPaintedItem>
#include <QVector>
#include <QPointF>
#include <QLineF>
#include <QPen>
class ElementArrary
{
public:
    ElementArrary()    {    }
    ElementArrary(const QPen &pen)
        : m_pen(pen)    {    }
    ElementArrary(const ElementArrary &e)
    {        m_lines = e.m_lines;
             m_pen = e.m_pen;
    }
    ElementArrary & operator=(const ElementArrary &e)
    {
        if(this != &e)
        {
            m_lines = e.m_lines;
            m_pen = e.m_pen;
        }
        return *this;
    }
    ~ElementArrary()    {    }
    QVector<QLineF> m_lines;
    QPen m_pen;
};

#endif // ELEMENTARRAY_H
