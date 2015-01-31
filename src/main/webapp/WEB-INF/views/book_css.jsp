<link href="assets/css/base/jquery-ui.css" rel="stylesheet">
    <style>
        #feedback { font-size: 1.4em; }
        #selectable1 .ui-selecting, #selectable2 .ui-selecting, #selectable3 .ui-selecting { background: #FECA40; }
        #selectable1 .ui-selected, #selectable2 .ui-selected, #selectable3 .ui-selected { background: #F39814; color: white; }
        #selectable1, #selectable2, #selectable3  { list-style-type: none; margin: 0; padding: 0; width: 550px; }
        #selectable1 li, #selectable2 li, #selectable3 li { margin: 3px; padding: 1px; float: left; width: 100px; height: 100px; font-size: 1em; text-align: center;}

        .container #products {
            position: relative;
            z-index: 2;
            float: left;
            width: 670px;
        }
        .container #sidebar {
            position: relative;
            z-index: 1;
            float: right;
            width: 224px;
        }
        .container #organizer {
            position: relative;
            z-index: 2;
            float: left;
            width: 670px;
        }
        .basket {
            position: relative;
        }

        .basket .basket_list {
            width: 220px;
            background-color: #fff;
            border: 2px dashed transparent;
            border-radius: 4px;
            -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
            box-shadow: 0 1px 2px rgba(0, 0, 0, .2);
        }

        .basket.active .basket_list,
        .basket.hover .basket_list { border-color: #ffa0a3 }

        .basket.active .basket_list { background-color: #fff8c1 }

        .basket.hover .basket_list { background-color: #ffa0a3 }

            /* .head */

        .basket .head {
            overflow: hidden;
            margin: 0 10px;
            height: 26px;
            line-height: 26px;
            color: #666;
            border-bottom: 1px solid #ddd;
        }

        .basket .head .name { float: left }

        .basket .head .total { float: right }

            /* .head */

        .basket ul { padding-bottom: 10px }

        .basket ul li {
            position: relative;
            clear: both;
            overflow: hidden;
            margin: 0 10px;
            height: 26px;
            line-height: 32px;
            border-bottom: 1px dashed #eee;
        }

        .basket ul li:hover { border-bottom-color: #ccc }

        .basket ul li input.count {
            float: right;
            margin: 3px 2px 0 0;
            width: 25px;
            line-height: 20px;
            text-align: center;
            border: 0;
            border-radius: 3px;
            background-color: #ddd;
        }

        .basket ul li span.name {
            display: block;
            float: left;
            width: 135px;
            font-weight: bold;
            white-space: nowrap;
            overflow: hidden;
            -o-text-overflow: ellipsis;
            -ms-text-overflow: ellipsis;
            text-overflow: ellipsis;
            -webkit-transition: width .2s ease;
            -moz-transition: width .2s ease;
            -o-transition: width .2s ease;
            -ms-transition: width .2s ease;
            transition: width .2s ease;
        }

        .basket ul li:hover span.name { width: 146px }
    </style>
