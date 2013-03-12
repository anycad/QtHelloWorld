#include <QtGui>
 
class TitleBar : public QWidget
{
    Q_OBJECT
public:
    TitleBar(QWidget *parent)
    {
        // Don't let this widget inherit the parent's backround color
        setAutoFillBackground(true);
        // Use a brush with a Highlight color role to render the background
        setBackgroundRole(QPalette::Highlight);
       
        minimize = new QToolButton(this);
        maximize = new QToolButton(this);
        close= new QToolButton(this);
       
        // Use the style to set the button pixmaps
        QPixmap pix = style()->standardPixmap(QStyle::SP_DriveHDIcon);
        close->setIcon(pix);
       
        maxPix = style()->standardPixmap(QStyle::SP_TitleBarMaxButton);
        maximize->setIcon(maxPix);
       
        pix = style()->standardPixmap(QStyle::SP_TitleBarMinButton);
        minimize->setIcon(pix);
 
        restorePix = style()->standardPixmap(QStyle::SP_TitleBarNormalButton);
       
        minimize->setMinimumHeight(20);
        close->setMinimumHeight(20);
        maximize->setMinimumHeight(20);
       
       
        QLabel *label = new QLabel(this);
        label->setText("Window Title");
        parent->setWindowTitle("Window Title");
       
        QHBoxLayout *hbox = new QHBoxLayout(this);
       
        hbox->addWidget(label);
        hbox->addWidget(minimize);
        hbox->addWidget(maximize);
        hbox->addWidget(close);
       
        hbox->insertStretch(1, 500);
        hbox->setSpacing(0);
        setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Fixed);
       
        maxNormal = false;
       
        connect(close, SIGNAL( clicked() ), parent, SLOT(close() ) );
        connect(minimize, SIGNAL( clicked() ), this, SLOT(showSmall() ) );
        connect(maximize, SIGNAL( clicked() ), this, SLOT(showMaxRestore() ) );
    }
   
public slots:
    void showSmall()
    {
        parentWidget()->showMinimized();
    }
   
    void showMaxRestore()
    {
        if (maxNormal) {
            parentWidget()->showNormal();
            maxNormal = !maxNormal;
            maximize->setIcon(maxPix);
        } else {
            parentWidget()->showMaximized();
            maxNormal = !maxNormal;
            maximize->setIcon(restorePix);
        }
    }
protected:
    void mousePressEvent(QMouseEvent *me)
    {
        startPos = me->globalPos();
        clickPos = mapToParent(me->pos());
    }
    void mouseMoveEvent(QMouseEvent *me)
    {
        if (maxNormal)
            return;
        parentWidget()->move(me->globalPos() - clickPos);
    }
 
private:
    QToolButton *minimize;
    QToolButton *maximize;
    QToolButton *close;
    QPixmap restorePix, maxPix;
    bool maxNormal;
    QPoint startPos;
    QPoint clickPos;
};