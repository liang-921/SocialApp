#ifndef PAINTING_H
#define PAINTING_H

#include <QQuickPaintedItem>
#include <QVector>
#include <QPointF>
#include <QLineF>
#include <QPen>
#include <QImage>


class ElementArrary;
//class CopyPaintItem;

class Painting : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(bool enabled READ isEnabled WRITE setEnabled)
    Q_PROPERTY(int pen_Width READ pen_Width WRITE setPen_Width)
    Q_PROPERTY(QColor pen_Color READ pen_Color WRITE setPen_Color)
    Q_PROPERTY(QImage myImage READ myImage WRITE setMyImage)

public:
    Painting(QQuickItem *parent = 0);
    ~Painting();
    bool isEnabled() const{ return m_bEnabled; }
    int pen_Width() const { return m_pen.width(); }
    QColor pen_Color() const { return m_pen.color(); }
    QImage myImage() const{return m_myImage;}
    Q_INVOKABLE void clear();
    Q_INVOKABLE void undo();
    //Q_INVOKABLE void save();
    void paint(QPainter *painter);

signals:
    void PaintChangeSignal();

public slots:
    void setEnabled(bool enabled){ m_bEnabled = enabled; }
    void setPen_Width(int width) { m_pen.setWidth(width); }
    void setPen_Color(QColor color) { m_pen.setColor(color); }
    void setMyImage(QImage myImage){m_myImage = myImage;}

protected:
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);
    void purgePaintElements();protected:
    QPointF m_lastPoint;
    QVector<ElementArrary*> m_elements;
    ElementArrary * m_element;
    // the Current ElementGroup
    bool m_bEnabled;
    bool m_bPressed;
    bool m_bMoved;
    QPen m_pen;
    QImage m_myImage;
//    CopyPaintItem *copyPainter;
    // the Current Pen
};
#endif // PAINTING_H
