/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

//#include <QWindow>

#include <QColor>
//#include <QOpenGLShaderProgram>
#include <QSharedPointer>
#include <QTimer>

class Renderer : public QObject
{
   Q_OBJECT

public:
   explicit Renderer(const QSurfaceFormat &format, Renderer *share = 0, QScreen *screen = 0);

   QSurfaceFormat format() const { return m_format; }

   public slots:
      void render(QSurface *surface, const QColor &color, const QSize &viewSize);

private:
   void initialize();

   qreal m_fAngle;
   bool m_showBubbles;
   void paintQtLogo();
   void createGeometry();
   void createBubbles(int number);
   void quad(qreal x1, qreal y1, qreal x2, qreal y2, qreal x3, qreal y3, qreal x4, qreal y4);
   void extrude(qreal x1, qreal y1, qreal x2, qreal y2);
   QVector<QVector3D> vertices;
   QVector<QVector3D> normals;
   int vertexAttr;
   int normalAttr;
   int matrixUniform;
   int colorUniform;

   bool m_initialized;
   QSurfaceFormat m_format;
   QOpenGLContext *m_context;
   QOpenGLShaderProgram *m_program;
};

class HelloWindow : public QWindow
{
   Q_OBJECT

public:
   explicit HelloWindow(const QSharedPointer<Renderer> &renderer);

   void updateColor();

   void exposeEvent(QExposeEvent *event);

signals:
   void needRender(QSurface *surface, const QColor &color, const QSize &viewSize);

   private slots:
      void render();

private:
   void mousePressEvent(QMouseEvent *);

   int m_colorIndex;
   QColor m_color;
   const QSharedPointer<Renderer> m_renderer;
   QTimer *m_timer;
};
