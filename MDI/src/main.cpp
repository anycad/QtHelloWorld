
#include <QApplication>
#include <QFile>
#include "mainwindow.h"
#include <iostream>

#ifdef WIN32
#include <Windows.h>
#endif

int main(int argc, char *argv[])
{
    Q_INIT_RESOURCE(Resource);

    std::cout << "MDI";
    QApplication app(argc, argv);

    //QFile file(":/qss/pagefold.qss");
    QFile file(":/qss/coffee.qss");
    file.open(QFile::ReadOnly);
    QString styleSheet = QString::fromLatin1(file.readAll());

    qApp->setStyleSheet(styleSheet);
    MainWindow mainWin;
    mainWin.show();

// Hide the console window for Release version.
#ifdef WIN32
#ifndef _DEBUG
    HWND hwnd = GetConsoleWindow();
    ShowWindow(hwnd, 0);
#endif
#endif

    return app.exec();
}
