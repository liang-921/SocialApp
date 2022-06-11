#include "painting.h"
#include <QPainter>
#include <QPen>
#include <QBrush>
#include <QColor>
#include <QDebug>
#include <elementarray.h>
#include <QQuickWindow>
//#include "copypaintitem.h"

Painting::Painting(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_element(0)
    , m_bEnabled(true)
    , m_bPressed(false)
    , m_bMoved(false)
    , m_pen(Qt::black)
{
    setAcceptedMouseButtons(Qt::LeftButton);
}
Painting::~Painting()
{
    purgePaintElements();
}
void Painting::clear()
{
    purgePaintElements();
    update();
}

void Painting::undo()
{
    if(m_elements.size()){
        delete m_elements.takeLast();
        update();
    }
}

//void Painting::save()
//{
//    copyPainter=new CopyPaintItem();
//    copyPainter->CopyPaint(m_elements,m_myImage);
//}

void Painting::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::Antialiasing,true);

    int size = m_elements.size();
    ElementArrary *element;
    for(int i = 0; i < size; ++i){
        element = m_elements.at(i);
        painter->setPen(element->m_pen);
        painter->drawLines(element->m_lines);
    }
}

void Painting::mousePressEvent(QMouseEvent *event)
{
    m_bMoved = false;
    if(!m_bEnabled || !(event->button() & acceptedMouseButtons()))    {
        QQuickPaintedItem::mousePressEvent(event);
    }else{
        //qDebug() << "mouse pressed";
        m_bPressed = true;
        m_element = new ElementArrary(m_pen);
        m_elements.append(m_element);
        m_lastPoint = event->pos();
        event->setAccepted(true);
    }
}
void Painting::mouseMoveEvent(QMouseEvent *event)
{
    if(!m_bEnabled || !m_bPressed || !m_element){
        QQuickPaintedItem::mousePressEvent(event);
    }    else    {
        //qDebug() << "mouse move";
        m_element->m_lines.append(QLineF(m_lastPoint, event->pos()));
        m_lastPoint = event->pos();
        update();
    }
}
void Painting::mouseReleaseEvent(QMouseEvent *event)
{
    if(!m_element || !m_bEnabled || !(event->button() & acceptedMouseButtons()))    {
        QQuickPaintedItem::mousePressEvent(event);
    }    else    {
        //qDebug() << "mouse released";
        m_bPressed = false;
        m_bMoved = false;
        m_element->m_lines.append(QLineF(m_lastPoint, event->pos()));
        update();
    }
}
void Painting::purgePaintElements()
{
    int size = m_elements.size();
    if(size > 0)    {
        for(int i = 0; i < size; ++i){
            delete m_elements.at(i);
        }
        m_elements.clear();
    }
    m_element = 0;
}

