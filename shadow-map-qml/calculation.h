#pragma once
#ifndef CALCULATION_H
#define CALCULATION_H
#include <QObject>

class Calculation:public QObject
{
    Q_OBJECT

private:
Q_PROPERTY(qint32 input_X_BSph WRITE setinput_X_BSph
                             READ input_X_BSph
                             NOTIFY input_X_BSphChanged)
    Q_PROPERTY(qint32 input_Y_BSph WRITE setinput_Y_BSph
                                 READ input_Y_BSph
                                 NOTIFY input_Y_BSphChanged)
    Q_PROPERTY(qint32 input_Z_BSph WRITE setinput_Z_BSph
                                 READ input_Z_BSph
                                 NOTIFY input_Z_BSphChanged)

    Q_PROPERTY(qint32 input_X_TPlayne WRITE setinput_X_TPlayne
                                 READ input_X_TPlayne
                                 NOTIFY input_X_TPlayneChanged)
        Q_PROPERTY(qint32 input_Y_TPlayne WRITE setinput_Y_TPlayne
                                     READ input_Y_TPlayne
                                     NOTIFY input_Y_TPlayneChanged)
        Q_PROPERTY(qint32 input_Z_TPlayne WRITE setinput_Z_TPlayne
                                     READ input_Z_TPlayne
                                     NOTIFY input_Z_TPlayneChanged)

    Q_PROPERTY(qint32 result_XX    READ result_XX
                                 NOTIFY result_XXChanged)
    Q_PROPERTY(qint32 result_YY    READ result_YY
                                 NOTIFY result_YYChanged)
    Q_PROPERTY(qint32 result_ZZ    READ result_ZZ
                                 NOTIFY result_ZZChanged)

qint32 m_input_X_BSp;
qint32 m_input_Y_BSp;
qint32 m_input_Z_BSp;
qint32 m_input_X_TPlayne;
qint32 m_input_Y_TPlayne;
qint32 m_input_Z_TPlayne;
qint32 m_result_XX;
qint32 m_result_YY;
qint32 m_result_ZZ;


public:
    Calculation(QObject*pobj=0);


    Q_INVOKABLE qint32 differen_XX(const qint32& m, const qint32& n);
    Q_INVOKABLE qint32 differen_YY(const qint32& m, const qint32& n);
    Q_INVOKABLE qint32 differen_ZZ(const qint32& m, const qint32& n);
    qint32 input_X_BSph (  )const;
    void setinput_X_BSph (const qint32&);
    qint32 result_XX( )const;
    qint32 input_Y_BSph (  )const;
    void setinput_Y_BSph (const qint32&);
    qint32 result_YY( )const;
    qint32 input_Z_BSph (  )const;
    void setinput_Z_BSph (const qint32&);
    qint32 result_ZZ( )const;

    qint32 input_X_TPlayne (  )const;
    void setinput_X_TPlayne (const qint32&);
       qint32 input_Y_TPlayne (  )const;
    void setinput_Y_TPlayne (const qint32&);
        qint32 input_Z_TPlayne (  )const;
    void setinput_Z_TPlayne (const qint32&);


signals:
   void input_X_BSphChanged(qint32);
   void input_Y_BSphChanged(qint32);
   void input_Z_BSphChanged(qint32);

   void input_X_TPlayneChanged(qint32);
   void input_Y_TPlayneChanged(qint32);
   void input_Z_TPlayneChanged(qint32);

   void result_XXChanged(qint32, qint32);
   void result_YYChanged(qint32, qint32);
   void result_ZZChanged(qint32, qint32);


};

#endif // CALCULATION_H
