import QtQuick 2.0
import QtCharts 2.0


//all the automatic meagurements are made from height of Item
Item {
    id: waterProgress

    property var metaData : ["from", "to", "value",
        "levelAsWave", "lineWidth",
        "color", "textColor",
    "fontSize",
    "title", "titleFont", "titleFontSize", "titleFontColor"]

    property double from:0 //min value
    property double value: 1 //current value
    property double to: 100 // max value

    property bool levelAsWave: true //show level as wave or simple line
    property int lineWidth: height / 50 //component lines width

    property color color: Qt.rgba(0.2, 0.62, 0.93, 0.7) // component color
    property color textColor: Qt.rgba(0.03, 0.3, 0.5, 1) //inner text color

    property int fontSize: height / 6

    property string title: ""
    property alias titleFont: labelTitle.font.family
    property alias titleFontSize: labelTitle.font.pointSize
    property alias titleFontColor: labelTitle.color

    function update(value) {
        waterProgress.value = value
        canvas.requestPaint()
        label.text = value.toFixed(2)
        label.transformOrigin = Item.Center
    }

    Text {
        id: labelTitle
        y: 0
        text: waterProgress.title
        color: Qt.rgba(0, 0, 0., 0.5)
        horizontalAlignment: Text.AlignHCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }

    function getWave(x, w, a)
    {
       return a* Math.sin(w*x)
    }

    function drawWave(ctx, centreX, centreY, radius, border, heightT)
    {
        var leftX = 0
        var rightX = 2 * radius

        var distance = rightX - leftX
        var w = distance/Math.PI/5
        var waveMaxHeight = 0.08*(2*radius)//9% from circle diameter
        var a = (1.0 - Math.abs((centreX - heightT)) / radius) * waveMaxHeight
        var x1 = centreX - Math.sqrt(Math.pow(radius, 2) - Math.pow(radius - heightT, 2))
        var x2 = centreX + Math.sqrt(Math.pow(radius, 2) - Math.pow(radius - heightT, 2))

        ctx.beginPath()
        ctx.fillStyle = waterProgress.color;
        ctx.strokeStyle = waterProgress.color;

        var iter = 0
        var y11 = 0
        var y = 0
        var x11 = 0;
        var stepW = 0.0002*(radius)
        var totalY = (centreY + radius) - heightT
        var amp = 0
        var dist = 0
        var startX = 0
        var startY = 0
        var finishX = 0
        var finishY = 0
        var isFirst = true
        var wave = 0

        if (x1 === x2 )
        {
            colsole.log("shit");
        }
        for (var i=x1;i<=x2;i+=stepW)
        {
            if (levelAsWave)
            {
                wave = getWave(i,1/distance*w,a)
            }

            amp = 1.0 - Math.abs(Math.abs(centreX - i) - radius) *a
            y = wave + (centreY + radius) - heightT
            dist = Math.sqrt(Math.pow(centreX - i, 2) + Math.pow(centreY - y, 2))

            if (dist <= radius || !levelAsWave) {
                if (isFirst) {
                    ctx.moveTo(i, y);
                    startX = i;
                    startY = y
                }

                ctx.lineTo(i,y);

                finishX = i
                finishY = y

                isFirst = false
            }

            if (!levelAsWave)
            {
                break
            }
        }

        iter = heightT

        while(iter >= 0) {
            y11 = (centreY + radius) - iter
            x11 = centreX + Math.sqrt(Math.pow(radius, 2) - Math.pow(radius - iter, 2))
            if (y11 > finishY) {
                ctx.lineTo(x11, y11);
            }
            iter -= 0.1
        }

        while(iter <= heightT) {
            y11 =  (centreY + radius) - iter
            x11 = centreX  - Math.sqrt(Math.pow(radius, 2) - Math.pow(radius - iter, 2))

            if (y11 > startY) {
                ctx.lineTo(x11, y11);
            }

            iter+=0.1
        }

        ctx.lineTo(startX, startY);

        ctx.fill()
        ctx.stroke()
    }

    function drawLine(ctx, centreX, centreY, radius, border,start, step )
    {
        ctx.beginPath();
        ctx.fillStyle = waterProgress.color;
        ctx.arc(centreX, centreY, radius - border, start + step, start - step, true);
        ctx.fill();
    }

    Canvas {
        id: canvas
        width: parent.height
        height: parent.height
        antialiasing: true

        property double radius: height/2.0
        property int border: 5
        readonly property double start: Math.PI*2.5
        readonly property double coef: waterProgress.value / (waterProgress.to - waterProgress.from)
        property double step: coef * Math.PI

        Text {
            id: label
            color: waterProgress.textColor
            font.bold: true
            font.pointSize: waterProgress.fontSize
            text: waterProgress.value.toFixed(2)
            z: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
        }


        onPaint: {
            var ctx = canvas.getContext("2d");
            ctx.reset();

            if (waterProgress.title !== "") {
                canvas.y = labelTitle.height
                canvas.x = labelTitle.height/2
                canvas.height = parent.height - labelTitle.height
                canvas.width = parent.height - labelTitle.height
                canvas.radius = canvas.height /2
            }

            var centreX = canvas.height / 2.0;
            var centreY = canvas.height / 2.0;

            var innerRadius = canvas.radius - canvas.border - waterProgress.lineWidth
            var heightT = innerRadius*2.0*coef

            ctx.lineWidth = 1;
            ctx.strokeStyle = Qt.rgba(0, 0, 0, 1)

            drawWave(ctx, centreY, centreX, innerRadius, border, heightT)

            ctx.beginPath();
            ctx.strokeStyle = waterProgress.color;
            ctx.lineWidth = waterProgress.lineWidth;
            ctx.arc(centreX, centreY, radius - waterProgress.lineWidth, 0, 2*Math.PI, false);
            ctx.stroke();
        }
    }
}
