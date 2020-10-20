#include "calculation.h"

Calculation::Calculation(QObject*pobj):QObject(pobj)
  , m_input_X_BSp(0), m_input_Y_BSp(0), m_input_Z_BSp(0), m_input_X_TPlayne(0), m_input_Y_TPlayne(0),
    m_input_Z_TPlayne(0), m_result_XX(0), m_result_YY(0), m_result_ZZ(0)
{
}

qint32 Calculation::differen_XX(const qint32& m, const qint32& n)
{
    return (m-n);
}
qint32 Calculation::differen_YY(const qint32& m, const qint32& n)
{
    return (m-n);
}
qint32 Calculation::differen_ZZ(const qint32& m, const qint32& n)
{
    return (m-n);
}

qint32 Calculation::input_X_BSph() const
{
    return m_input_X_BSp;
}

qint32 Calculation::input_Y_BSph() const
{
    return m_input_Y_BSp;
}

qint32 Calculation::input_Z_BSph() const
{
    return m_input_Z_BSp;
}



qint32 Calculation::input_X_TPlayne() const
{
    return m_input_X_TPlayne;
}

qint32 Calculation::input_Y_TPlayne() const
{
    return m_input_Y_TPlayne;
}

qint32 Calculation::input_Z_TPlayne() const
{
    return m_input_Z_TPlayne;
}



qint32 Calculation::result_XX() const
{
    return m_result_XX;
}

qint32 Calculation::result_YY() const
{
    return m_result_YY;
}

qint32 Calculation::result_ZZ() const
{
    return m_result_ZZ;
}

void Calculation::setinput_X_BSph(const qint32& n)
{
m_input_X_BSp = n;
 m_result_XX = differen_XX(m_input_X_BSp, m_input_X_TPlayne);
 emit input_X_BSphChanged(m_input_X_BSp);
 emit result_XXChanged(m_input_X_BSp, m_input_X_TPlayne);
}
void Calculation::setinput_Y_BSph(const qint32& n)
{
m_input_Y_BSp = n;
 m_result_YY = differen_YY(m_input_Y_BSp, m_input_Y_TPlayne);
 emit input_Y_BSphChanged(m_input_Y_BSp);
 emit result_YYChanged(m_input_Y_BSp, m_input_Y_TPlayne);
}
void Calculation::setinput_Z_BSph(const qint32& n)
{
m_input_Z_BSp = n;
 m_result_ZZ = differen_YY(m_input_Z_BSp, m_input_Y_TPlayne);
 emit input_Z_BSphChanged(m_input_Z_BSp);
 emit result_ZZChanged(m_input_Z_BSp, m_input_Y_TPlayne);
}


void Calculation::setinput_X_TPlayne(const qint32& n)
{
m_input_X_TPlayne = n;
 m_result_XX = differen_XX(m_input_X_BSp, m_input_X_TPlayne);
 emit input_X_TPlayneChanged(m_input_X_BSp);
 emit result_XXChanged(m_input_X_BSp, m_input_X_TPlayne);
}
void Calculation::setinput_Y_TPlayne(const qint32& n)
{
m_input_Y_TPlayne = n;
 m_result_YY = differen_YY(m_input_Y_BSp, m_input_Y_TPlayne);
 emit input_Y_TPlayneChanged(m_input_Y_BSp);
 emit result_YYChanged(m_input_Y_BSp, m_input_Y_TPlayne);
}
void Calculation::setinput_Z_TPlayne(const qint32& n)
{
m_input_Z_BSp = n;
 m_result_ZZ = differen_YY(m_input_Z_BSp, m_input_Y_TPlayne);
 emit input_Z_BSphChanged(m_input_Z_BSp);
 emit result_ZZChanged(m_input_Z_BSp, m_input_Y_TPlayne);
}
